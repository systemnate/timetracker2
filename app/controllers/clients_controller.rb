class ClientsController < ApplicationController
  load_and_authorize_resource

  def index
    @clients = Client.order('position')
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, flash: { success: 'Client was successfully created.' } }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, flash: { success: 'Client was successfully updated.' } }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, flash: { error: 'Client was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  def sort
    params[:client].each_with_index do |id, index|
        client = Client.find(id)
        client.update_attribute(:position, index) if client
    end
    render nothing: true    
  end

  private

    def client_params
      params.require(:client).permit(:name, :contact, :connect_info)
    end
end
