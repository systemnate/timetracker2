class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.all.order('name')
    @priorities = Priority.all.order('name')
    @products = Product.all.order('name')
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      if params[:scope]
        @tasks = Task.send(params[:scope])
      elsif params[:showall]
        @tasks = Task.all.order('created_at DESC')
      else
        @tasks = Task.all.where('assigned_to = ?', current_user).order('created_at DESC').
          reject { |t| t.status.default_view != true }
      end
    end
  end

  def show
  end

  def new
  end

  def create
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
        @tasks = Task.search params[:search], fields: [:title, :alternate_id, :summary]
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
      params.require(:task).permit(:title, :status_id, 
        :product_id, :priority_id, :summary, :client_id, :alternate_id, :tag_list, :assigned_to, :billable)
    end
end