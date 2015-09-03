# Filters Helper
module FiltersHelper
  def filter_label(filter)
    if filter.color.name
      class_name = 'label label-' + label_lookup(filter.color.name)
      content_tag(:span, class: class_name) do
        filter.name
      end
    else
      'N/A'
    end
  end
end
