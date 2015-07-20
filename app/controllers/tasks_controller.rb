class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.includes(:color).order('name')
    @priorities = Status.includes(:color).order('name')
    @products = Status.includes(:color).order('name')
    if params[:status_id]
      @tasks = Task.all.where("status_id = ?", params[:status_id])
    elsif params[:priority_id]
      @tasks = Task.all.where("priority_id = ?", params[:priority_id])
    elsif params[:product_id]
      @tasks = Task.all.where("product_id = ?", params[:product_id])
    elsif params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    elsif params[:all_tasks]
      @tasks = Task.includes(:status, :client, :priority => :color, :product => :color)
    else
      @tasks = Task.includes(:status, :client, :priority => :color, :product => :color).where('assigned_to = ?', current_user).order('created_at DESC').
          reject { |t| t.status.default_view != true }
    end
  end

  def show
    @task_details = @task.task_details.order("created_at")
  end

  def new
    if Task.all.count <= 1
      Task.reindex
      TaskDetail.reindex
    end
  end

  def create
    tp = task_params
    
    if !tp[:client_name].blank?
      c = Client.create(name: tp[:client_name])
      @task.client_id = c.id
    end

    if !tp[:status_name].blank?
      color = Color.find_by(name: "Grey")
      s = Status.create(name: tp[:status_name], color_id: color.id, default_view: true)
      @task.status_id = s.id
    end

    if !tp[:priority_name].blank?
      color = Color.find_by(name: "Grey")
      p = Priority.create(name: tp[:priority_name], color_id: color.id)
      @task.priority_id = p.id
    end

    if !tp[:product_name].blank?
      color = Color.find_by(name: "Grey")
      p = Product.create(name: tp[:product_name], color_id: color.id)
      @task.product_id = p.id
    end

    @task.created_by = current_user.id

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
      UserNotifier.send_status_update(@task, current_account).deliver_now
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
      params.require(:task).permit(:title, :status_id,
        :product_id, :priority_id, :client_id, :alternate_id, :tag_list, :project_id,
        :assigned_to, :billable, :client_name, :status_name, :priority_name, :product_name, :notify_email)
    end
end
