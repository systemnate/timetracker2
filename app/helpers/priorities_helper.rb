# - Helper for Priorities
module PrioritiesHelper
  def filter_priority(priority)
    if priority.color.name
      class_name = 'label label-' + label_lookup(priority.color.name)
      content_tag(:span, class: class_name) do
        priority.name
      end
    else
      'N/A'
    end
  end
end
