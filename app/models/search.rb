class Search < ActiveRecord::Base
  def tasks
    @tasks ||= find_tasks
  end

private

  def find_tasks
    if keywords.present?
      task_detail_list = []
      TaskDetail.includes(:task).all.each do |td|
        if td.body.downcase.include? keywords.downcase
          task_detail_list << td.task
        end
      end
      task_detail_list = task_detail_list.grep(Task)
      task_detail_list = Task.includes(:status, :client, :product, :priority, 
        :priority => :color, :status => :color, :product => :color).
        where(id: task_detail_list.map(&:id))
      tasks = task_detail_list
    else
      tasks = Task.includes(:status, :client, :product, :priority, :priority => :color, :status => :color, :product => :color).order("created_at DESC")
    end
    search_keywords(tasks)
  end

  def search_keywords(tasks)
    tasks = tasks.where("id = ?", task_id) if task_id.present?
    tasks = tasks.where(status_id: status_id) if status_id.present?
    tasks = tasks.where(product_id: product_id) if product_id.present?
    tasks = tasks.where(priority_id: priority_id) if priority_id.present?
    tasks = tasks.where(client_id: client_id) if client_id.present?
    tasks = tasks.where(assigned_to: assigned_to) if assigned_to.present?
    tasks = tasks.where(created_by: created_by) if created_by.present?
    tasks = tasks.where("alternate_id like ?", "%#{alternate_id}%") if alternate_id.present?
    tasks = tasks.where("title like ?", "%#{title}%") if title.present?
    tasks = tasks.where(billable: billable) if billable.present?
    tasks = tasks.where(project_id: project_id) if project_id.present?
    tasks
  end
end
