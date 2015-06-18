class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.all.order('name')
    @priorities = Priority.all.order('name')
    @products = Product.all.order('name')
    if params[:status_id]
      @tasks = Task.all.where("status_id = ?", params[:status_id])
    elsif params[:priority_id]
      @tasks = Task.all.where("priority_id = ?", params[:priority_id])
    elsif params[:product_id]
      @tasks = Task.all.where("product_id = ?", params[:product_id])
    elsif params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    elsif params[:all_tasks]
      @tasks = Task.all
    else
      @tasks = Task.all.where('assigned_to = ?', current_user).order('created_at DESC').
          reject { |t| t.status.default_view != true }
    end
  end

  def show
  end

  def new
    if Task.all.count <= 1
      Task.reindex
      TaskDetail.reindex
    end
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