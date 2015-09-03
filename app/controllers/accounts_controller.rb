class AccountsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]
  skip_before_filter :verify_authenticity_token, :only => :create
  def new
    @plan_id = params[:plan_id]
    @account = Account.new
    @account.build_owner
  end

  def create
    @plan_id = params[:account][:plan_id]
    @account = Account.new(account_params)
    if @account.valid?

      customer = Stripe::Customer.create(
        description: params[:account][:subdomain], 
        plan: params[:account][:plan_id], 
        card: params[:account][:stripe_card_token]
      )

      @account.stripe_customer_token = customer.id
      @account.save!

      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch!(@account.subdomain)

      redirect_to(new_user_session_url(subdomain: @account.subdomain),
                  flash: { success: 'Signed up successfully' } )
      UserNotifier.send_admin_notice(@account.subdomain).deliver_now
    else
      render :new, plan_id: params[:account][:plan_id]
    end    
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

  private

  def account_params
    params.require(:account).permit(:stripe_card_token, :plan_id, :subdomain, owner_attributes:
                                                [:name, :email, :password,
                                                 :password_confirmation])
  end
end
