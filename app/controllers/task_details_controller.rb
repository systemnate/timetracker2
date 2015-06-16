class TaskDetailsController < ApplicationController
  load_and_authorize_resource :task
  load_and_authorize_resource :task_detail, :through => :task

  def new
    @task_detail.user_id = current_user
  end

  def create
    if @task_detail.save
      redirect_to @task, notice: "New detail successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task_detail.update(task_detail_params)
    if @task_detail.save
      redirect_to @task, notice: "Detail successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @task_detail.destroy
    redirect_to @task, alert: "Detail successfully deleted!"
  end

  private
    def task_detail_params
      params.require(:task_detail).permit(:body, :time_spent, :important, :user_id, :task_attachment)
    end
end