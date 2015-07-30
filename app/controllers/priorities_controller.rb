class PrioritiesController < ApplicationController
  load_and_authorize_resource

  def index
    @priorities = Priority.includes(:color).order("position")
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

  def sort
    params[:priority].each_with_index do |id, index|
        priority = Priority.find(id)
        priority.update_attribute(:position, index) if priority
    end
    render nothing: true    
  end

  private

  def priority_params
    params.require(:priority).permit(:name, :color_id)
  end
end