class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_schema, :authenticate_user!, :set_mailer_host
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation).concat([:name])
    devise_parameter_sanitizer.for(:invite) << :role_id
  end

  private

  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?
    if current_account
      Apartment::Tenant.switch!(current_account.subdomain)
    else
      redirect_to root_url(subdomain: false)
    end
  end

  def current_account
    @current_account ||= Account.find_by(subdomain: request.subdomain)
  end
  helper_method :current_account

  def set_mailer_host
    subdomain = current_account ? "#{current_account.subdomain}." : ''
    ActionMailer::Base.default_url_options[:host] = "#{subdomain}taskclash.com"
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_invite_path_for(_resource)
    users_path
  end
end
