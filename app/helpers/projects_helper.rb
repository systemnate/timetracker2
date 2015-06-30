# Projects Helper
module ProjectsHelper
  def show_project_time(project)
    time_spent = Project.time_spent(project)
    if time_spent < 60
      content_tag(:strong, pluralize(time_spent, 'minute'),
                  class: 'label label-default')
    else
      content_tag(:strong,
                  pluralize(number_with_precision(time_spent / 60.0,
                                                  precision: 2),
                            'hour'),
                  class: 'label label-default')
    end
  end

  def time_spent(project)
    time_allowed = project.allotted_time
    time_spent = 0
    project.tasks.each do |t|
      t.task_details.each do |td|
        time_spent += td.time_spent
      end
    end
    time_allowed - time_spent
  end
end
