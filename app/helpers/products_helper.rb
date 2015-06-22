# - Product Helper
module ProductsHelper
  def filter_product(product)
    if product.color.name
      class_name = 'label label-' + label_lookup(product.color.name)
      content_tag(:span, class: class_name) do
        product.name
      end
    else
      'N/A'
    end
  end
end
