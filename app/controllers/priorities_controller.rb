class PrioritiesController < ApplicationController
  before_action :find_priority, only: [:show, :edit, :update, :destroy]

  def index
    @priorities = Priority.all
  end

  def show
  end

  def new
    @priority = Priority.new
  end

  def edit
  end

  def create
    @priority = Priority.new(priority_params)
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
  end

  private

  def priority_params
    params.require(:priority).permit(:name, :color_id)
  end

  def find_priority
    @priority = Priority.find(params[:id])
  end
end