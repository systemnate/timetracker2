module PrioritiesHelper
  def filter_priority(priority)
    if priority.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        priority.name
      end
    elsif priority.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        priority.name
      end
    elsif priority.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        priority.name
      end
    elsif priority.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        priority.name
      end
    elsif priority.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        priority.name
      end
    elsif priority.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        priority.name
      end        
    else
      'NA'
    end
  end
end