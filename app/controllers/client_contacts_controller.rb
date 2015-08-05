class ClientContactsController < ApplicationController
  load_and_authorize_resource :client
  load_and_authorize_resource :client_contact, :through => :client

  def show
  end

  def new
  end

  def edit
  end

  def create
    @client_contact.save
    respond_to do |format|
      format.html { redirect_to @client }
      format.js
    end
  end

  def update
    if @client_contact.update(client_contact_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client_contact.destroy
    respond_to do |format|
      format.html { redirect_to @client }
      format.js
    end
  end

  private

  def client_contact_params
    params.require(:client_contact).permit(:name, :address, :email, :phone_number, :other)
  end
end
