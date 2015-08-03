class AccountsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]
  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.valid?
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch!(@account.subdomain)
      @account.save
      redirect_to(new_user_session_url(subdomain: @account.subdomain),
                  flash: { success: 'Signed up successfully' } )
      UserNotifier.send_admin_notice(@account.subdomain).deliver_now
    else
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:subdomain, owner_attributes:
                                                [:name, :email, :password,
                                                 :password_confirmation])
  end
end