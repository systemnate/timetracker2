module TaskDetailsHelper
  def show_time_spent(task_detail)
    if task_detail.time_spent < 60
      content_tag(:p, show_created_by(task_detail) + " on " + show_date_created(task_detail) + " - Time Spent: " + pluralize(task_detail.time_spent, "minute") + ".")
    else
      content_tag(:p, show_created_by(task_detail) + " on " + show_date_created(task_detail) + " - Time Spent: " + pluralize(number_with_precision(task_detail.time_spent / 60.0, precision: 2), "hour") + ".")
    end
  end

  def show_created_by(task_detail)
    user = User.find_by(id: task_detail.user_id)
    if user.nil?
      task_detail.update(user_id: current_user.id)
      user = User.find_by(id: task_detail.user_id)
    end
    name = user.name
    "Created by: " + user.name
  end

  def show_date_created(task_detail)
    task_detail.created_at.getlocal.to_s + " (" + time_ago_in_words(task_detail.created_at.getlocal) + " ago)"
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

  def attachment_count(task)
    count = 0
    task.task_details.all.each do |td|
      if td.task_attachment_file_name
        count += 1
      end
    end
    count
  end

end