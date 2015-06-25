class PrioritiesController < ApplicationController
  load_and_authorize_resource

  def index
    @priorities = Priority.all.order("name")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @priority.save
      redirect_to @priority, notice: "Priority successfully created!"
    else
      render :new
    end
  end

  def update
    @priority.update(priority_params)
    if @priority.save
      redirect_to @priority, notice: "Priority successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @priority.destroy
    redirect_to priorities_path, alert: 'Priority was successfully destroyed.'
  end

  private

  def priority_params
    params.require(:priority).permit(:name, :color_id)
  end
end