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
      redirect_to @priority, flash: { success: "Priority successfully created!" }
    else
      render :new
    end
  end

  def update
    @priority.update(priority_params)
    if @priority.save
      redirect_to @priority, flash: { success: "Priority successfully updated!" }
    else
      render :edit
    end
  end

  def destroy
    @priority.destroy
    redirect_to priorities_path, flash: { error: 'Priority was successfully destroyed.' }
  end

  def sort
    super
  end
  
  private

  def priority_params
    params.require(:priority).permit(:name, :color_id)
  end
end
