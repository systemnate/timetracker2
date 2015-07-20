class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:client, :user, :tasks)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    if Task.all.count <= 1
      Task.reindex
      TaskDetail.reindex
    end
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project, notice: "Project successfully created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :allotted_time, :actual_time, :due_date, :title, :client_id)
    end
end