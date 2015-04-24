module ProjectsHelper
  def show_project_time(project)
    time_spent = Project.time_spent(project)
    if time_spent < 60
      content_tag(:strong, pluralize(time_spent, "minute"), class: "label label-default")
    else
      content_tag(:strong, pluralize(number_with_precision(time_spent/60.0, precision: 2), "hour"), class: "label label-default")
    end
  end  
end