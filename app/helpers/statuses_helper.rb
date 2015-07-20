# Statuses Helper
module StatusesHelper
  def filter_status(status)
    if status.color.name
      class_name = 'label label-' + label_lookup(status.color.name)
      content_tag(:span, class: class_name) do
        status.name
      end
    else
      'N/A'
    end
  end

  def show_on_default_view(status)
    if status.default_view == true
      'Yes'
    else
      'No'
    end
  end

  def show_is_complete(status)
    if status.is_complete == true
      "Yes"
    else
      "No"
    end
  end
end
