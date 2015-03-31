class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def edit
    @status = Status.find(params[:id])
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status), notice: "Status successfully created!"
    else
      render :new
    end
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    if @status.save
      redirect_to status_path(@status), notice: "Status successfully update!"
    else
      render :edit
    end
  end

  private
  def status_params
    params.require(:status).permit(:name, :color_id)
  end
end