class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      if params[:scope]
        @tasks = Task.send(params[:scope])
      else
        @tasks = Task.all.order('created_at DESC')
      end
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_task_task_detail_path(@task), notice: "Task created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to @task, notice: "Task successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def search
    begin
      if params[:search].present?
        @tasks = Task.search params[:search], fields: [:title, :alternate_id]
        @task_details = TaskDetail.search params[:search], fields: [:body]
      else
        @tasks = Task.all
      end
    rescue Exception
      Task.reindex
      TaskDetail.reindex
      @tasks = Task.search params[:search], fields: [:title, :alternate_id]
      @task_details = TaskDetail.search params[:search], fields: [:body]
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :status_id, :product_id, :priority_id, :summary, :client_id, :alternate_id, :tag_list)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end