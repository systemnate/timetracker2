module ProductsHelper
  def filter_product(product)
    if product.color.name == "Green"
      content_tag(:span, class: "label label-success") do
        product.name
      end
    elsif product.color.name == "Red"
      content_tag(:span, class: "label label-danger") do
        product.name
      end
    elsif product.color.name == "Blue"
      content_tag(:span, class: "label label-primary") do
        product.name
      end
    elsif product.color.name == "Grey"
      content_tag(:span, class: "label label-default") do
        product.name
      end
    elsif product.color.name == "Light Blue"
      content_tag(:span, class: "label label-info") do
        product.name
      end
    elsif product.color.name == "Orange"
      content_tag(:span, class: "label label-warning") do
        product.name
      end        
    else
      'NA'
    end
  end  
end