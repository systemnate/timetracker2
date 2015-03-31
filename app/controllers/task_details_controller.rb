class TaskDetailsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @task_detail = @task.task_details.new
  end

  def create
    @task = Task.find(params[:task_id])
    @task_detail = @task.task_details.new(detail_params)
    if @task_detail.save
      redirect_to @task, notice: "New detail successfully created!"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @task_detail = @task.task_details.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @task_detail = TaskDetail.find(params[:id])
    @task_detail.update(detail_params)
    if @task_detail.save
      redirect_to @task, notice: "Detail successfully updated!"
    else
      render :edit
    end
  end

  private
    def detail_params
      params.require(:task_detail).permit(:body, :time_spent, :important)
    end
end