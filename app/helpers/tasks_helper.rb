# - View helpers for labels
module TasksHelper
  def label_lookup(name)
    case name
    when 'Green'
      'success'
    when 'Red'
      'danger'
    when 'Blue'
      'primary'
    when 'Grey'
      'default'
    when 'Light Blue'
      'info'
    when 'Orange'
      'warning'
    end
  end

  def show_status(task)
    if task.status
      task.status.name
    else
      'N/A'
    end
  end

  def show_product(task)
    if task.product
      task.product.name
    else
      'N/A'
    end
  end

  def show_priority(task)
    if task.priority
      task.priority.name
    else
      'N/A'
    end
  end

  def show_client(task)
    if task.client
      task.client.name
    else
      'N/A'
    end
  end

  def show_summary(task)
    if task.summary
      content_tag(:p, task.summary.html_safe)
    else
      'N/A'
    end
  end

  def label_id(task)
    content_tag(:span, class: 'label label-default') do
      task.id.to_s
    end
  end

  def label_client(task)
    if task.client
      content_tag(:span, class: 'label label-default') do
        link_to(show_client(task), edit_task_path(task), style: 'color: white')
      end
    else
      show_client(task)
    end
  end

  def label_date(task)
    content_tag(:span, class: 'label label-default') do
      link_to(
        task.created_at.getlocal,
        edit_task_path(task),
        style: 'color: white'
      )
    end
  end

  def label_status(task)
    if task.status.color.name
      class_name = 'label label-' + label_lookup(task.status.color.name)
      content_tag(:span, class: class_name) do
        link_to(show_status(task), edit_task_path(task), style: 'color: white')
      end
    else
      'NA'
    end
  end

  def label_priority(task)
    if task.priority.color.name
      class_name = 'label label-' + label_lookup(task.priority.color.name)
      content_tag(:span, class: class_name) do
        link_to(show_priority(task), edit_task_path(task),
                style: 'color: white')
      end
    else
      'N/A'
    end
  end

  def label_alternate_id(task)
    if !task.alternate_id.blank?
      content_tag(:span, class: 'label label-default') do
        link_to(task.alternate_id, edit_task_path(task), style: 'color: white')
      end
    else
      ''
    end
  end

  def label_product(task)
    class_name = 'label label-' + label_lookup(task.product.color.name)
    if task.product.color.name
      content_tag(:span, class: class_name) do
        link_to(show_product(task), edit_task_path(task), style: 'color: white')
      end
    else
      'N/A'
    end
  end

  def show_time(task)
    time_spent = 0
    task.task_details.each do |detail|
      time_spent += detail.time_spent
    end
    if time_spent < 60
      content_tag(:strong,
                  pluralize(time_spent, 'minute'), class: 'label label-default')
    else
      content_tag(:strong, pluralize(
                             number_with_precision(time_spent / 60.0,
                                                   precision: 2), 'hour'),
                  class: 'label label-default')
    end
  end

  def show_color(obj)
    class_name = 'square-' + obj.color.name.downcase.gsub(' ', '').to_s
    content_tag(:div, nil, class: class_name)
  end
end
