class statuses_controller < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end
end