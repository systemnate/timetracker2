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

  def show_summary(task)
    if task.summary
      content_tag(:p, task.summary.html_safe)
    else
      "N/A"
    end
  end

  def label_id(task)
    content_tag(:span, class: "label label-default") do
      task.id.to_s
    end
  end

  def label_client(task)
    if task.client
      content_tag(:span, class: "label label-default") do
      link_to(show_client(task), edit_task_path(task), style: "color: white")
    end
    else
      show_client(task)
    end
  end

  def label_date(task)
    content_tag(:span, class: "label label-default") do
      link_to(task.created_at.getlocal, edit_task_path(task), style: "color: white")
    end
  end
  
  def label_status(task)
    if task.status.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end
    elsif task.status.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end
    elsif task.status.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end
    elsif task.status.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end
    elsif task.status.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end
    elsif task.status.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        link_to(show_status(task), edit_task_path(task), style: "color: white")
      end        
    else
      'NA'
    end
  end

  def label_priority(task)
    if task.priority.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end
    elsif task.priority.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end
    elsif task.priority.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end
    elsif task.priority.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end
    elsif task.priority.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end
    elsif task.priority.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        link_to(show_priority(task), edit_task_path(task), style: "color: white")
      end      
    else
      'NA'
    end
  end

  def label_alternate_id(task)
    if !task.alternate_id.blank?
      content_tag(:span, class: "label label-default") do
        link_to(task.alternate_id, edit_task_path(task), style: "color: white")
      end
    else
      ""
    end
  end

  def label_product(task)
    if task.product.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    elsif task.product.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    elsif task.product.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    elsif task.product.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    elsif task.product.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    elsif task.product.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        link_to(show_product(task), edit_task_path(task), style: "color: white")
      end
    else
      'NA'
    end
  end  

  def label_client(task)
    content_tag(:span, class: "label label-default") do
      link_to(show_client(task), edit_task_path(task), style: "color: white")
    end
  end

  def show_time(task)
    time_spent = 0
    task.task_details.each do |detail|
      time_spent += detail.time_spent
    end
    if time_spent < 60
      content_tag(:strong, pluralize(time_spent, "minute"), class: "label label-default")
    else
      content_tag(:strong, pluralize(number_with_precision(time_spent/60.0, precision: 2), "hour"), class: "label label-default")
    end
  end

  def show_color(obj)
    if obj.color.name == "Green"
      content_tag(:div, nil, class: "square-green")
    elsif obj.color.name == "Red"
      content_tag(:div, nil, class: "square-red")
    elsif obj.color.name == "Blue"
      content_tag(:div, nil, class: "square-blue")
    elsif obj.color.name == "Light Blue"
      content_tag(:div, nil, class: "square-lightblue")
    elsif obj.color.name == "Orange"
      content_tag(:div, nil, class: "square-orange")
    elsif obj.color.name == "Grey"
      content_tag(:div, nil, class: "square-grey")
    end
  end
end