module StatusesHelper
  def filter_status(status)
    if status.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        status.name
      end
    elsif status.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        status.name
      end
    elsif status.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        status.name
      end
    elsif status.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        status.name
      end
    elsif status.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        status.name
      end
    elsif status.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        status.name
      end        
    else
      'NA'
    end
  end

  def show_on_default_view(status)
    if status.default_view == true
      'Yes'
    else
      'No'
    end
  end
end