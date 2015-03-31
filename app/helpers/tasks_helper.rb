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

  def label_id(task)
    content_tag(:span, class: "label label-default") do
      task.id.to_s
    end
  end

  def label_status(task)
    if task.status.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        show_status(task)
      end
    elsif task.status.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        show_status(task)
      end
    elsif task.status.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        show_status(task)
      end
    elsif task.status.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        show_status(task)
      end
    else
      'NA'
    end
  end

  def label_priority(task)
    if task.priority.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        show_priority(task)
      end
    elsif task.priority.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        show_priority(task)
      end
    elsif task.priority.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        show_priority(task)
      end
    elsif task.priority.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        show_priority(task)
      end
    else
      'NA'
    end
  end

  def label_product(task)
    if task.product.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        show_product(task)
      end
    elsif task.product.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        show_product(task)
      end
    elsif task.product.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        show_product(task)
      end
    elsif task.product.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        show_product(task)
      end
    else
      'NA'
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