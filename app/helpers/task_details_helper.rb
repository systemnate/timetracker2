module TaskDetailsHelper
  def show_time_spent(task_detail)
    if task_detail.time_spent < 60
      content_tag(:p, "Time Spent: " + pluralize(task_detail.time_spent, "minute"))
    else
      content_tag(:p, "Time Spent: " + pluralize(number_with_precision(task_detail.time_spent / 60.0, precision: 2), "hour"))
    end
  end

  def show_detail(task_detail)
    if task_detail.important?
      content_tag(:div, class: "card card-primary") do
        show_time_spent(task_detail).
        concat(content_tag(:p, task_detail.body.html_safe))
      end
    else
      content_tag(:div, class: "card card-dark") do
        show_time_spent(task_detail).
        concat(content_tag(:p, task_detail.body.html_safe))
      end      
    end
  end
end