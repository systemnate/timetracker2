class StatusesController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.includes(:color).order("name")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @status.save
      redirect_to status_path(@status), notice: "Status successfully created!"
    else
      render :new
    end
  end

  def update
    @status.update(status_params)
    if @status.save
      redirect_to status_path(@status), notice: "Status successfully update!"
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to statuses_path, alert: 'Status was successfully destroyed.'
  end

  private
  def status_params
    params.require(:status).permit(:name, :color_id, :default_view, :is_complete)
  end
end
