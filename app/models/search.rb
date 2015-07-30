class Search < ActiveRecord::Base
  def tasks
    @tasks ||= find_tasks
  end

private

  def find_tasks
    tasks = Task.includes(:status, :client, :product, :priority, :priority => :color, :status => :color, :product => :color).order("created_at DESC")
    #task_details = TaskDetail.task.where("body like ?", "%#{keywords}%") if keywords.present?
    tasks = tasks.where("id = ?", task_id) if task_id.present?
    #tasks = tasks.where("created_at >= ? AND created_at <= ?", created_at.beginning_of_day, created_at.end_of_day) if created_at.present?
    #tasks = tasks.where("updated_at >= ? AND updated_at <= ?", updated_at.beginning_of_day, updated_at.end_of_day) if updated_at.present?   
    tasks = tasks.where("title like ?", "%#{title}%") if title.present?
    tasks = tasks.where(status_id: status_id) if status_id.present?
    tasks = tasks.where(product_id: product_id) if product_id.present?
    tasks = tasks.where(priority_id: priority_id) if priority_id.present?
    tasks = tasks.where(client_id: client_id) if client_id.present?
    tasks = tasks.where(assigned_to: assigned_to) if assigned_to.present?
    tasks = tasks.where(created_by: created_by) if created_by.present?
    tasks = tasks.where("alternate_id like ?", "%#{alternate_id}%") if alternate_id.present?
    tasks = tasks.where(billable: billable) if billable.present?
    tasks = tasks.where(project_id: project_id) if project_id.present?
    tasks
  end
end
