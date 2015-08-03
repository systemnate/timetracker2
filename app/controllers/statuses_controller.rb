class StatusesController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.includes(:color).order("position")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @status.save
      redirect_to @status, flash: { success: "Status successfully created!" }
    else
      render :new
    end
  end

  def update
    @status.update(status_params)
    if @status.save
      redirect_to @status, flash: { success: "Status successfully update!" }
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to statuses_path, flash: { error: 'Status was successfully destroyed.' }
  end

  def sort
    params[:status].each_with_index do |id, index|
        status = Status.find(id)
        status.update_attribute(:position, index) if status
    end
    render nothing: true    
  end

  private
  def status_params
    params.require(:status).permit(:name, :color_id, :default_view, :is_complete)
  end
end
