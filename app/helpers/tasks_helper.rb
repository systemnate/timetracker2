module TasksHelper
  def show_status(task)
    if task.status
      task.status.name
    else
      "N/A"
    end
  end

  def show_product(task)
    if task.product
      task.product.name
    else
      "N/A"
    end
  end
  
  def show_priority(task)
    if task.priority
      task.priority.name
    else
      "N/A"
    end
  end

  def show_client(task)
    if task.client
      task.client.name
    else
      "N/A"
    end
  end

  def label_status(task)
    if task.status
      if task.status.name == 'Open'
        content_tag(:span, class: "label label-success") do
          show_status(task)
        end
      elsif task.status.name == 'Closed'
        content_tag(:span, class: "label label-danger") do
          show_status(task)
        end
      else
        content_tag(:span, class: "label label-primary") do
          show_status(task)
        end
      end
    else
      'N/A'
    end
  end

  def label_priority(task)
    if task.priority
      if task.priority.name == "1 - URGENT"
        content_tag(:span, class: "label label-danger") do
          show_priority(task)
        end
      elsif task.priority.name == "2 - HIGH"
        content_tag(:span, class: "label label-warning") do
          show_priority(task)
        end
      elsif task.priority.name == "3 - MEDIUM"
        content_tag(:span, class: "label label-primary") do
          show_priority(task)
        end
      else
        content_tag(:span, class: "label label-default") do
          show_priority(task)
        end
      end
    else
      'N/A'
    end
  end

  def label_client(task)
    content_tag(:span, class: "label label-default") do
      show_client(task)
    end
  end

  def show_time(task)
    time_spent = 0
    task.task_details.each do |detail|
      time_spent += detail.time_spent
    end
    if time_spent < 60
      content_tag(:strong, pluralize(time_spent, "minutes"), class: "label label-default")
    else
      content_tag(:strong, pluralize(number_with_precision(time_spent/60.0, precision: 2), "hour"), class: "label label-default")
    end
  end
end