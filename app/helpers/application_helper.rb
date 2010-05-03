
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    base_title = "E-PPIKM"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
    end

  def display_tags(product)
    product.tags.collect{|tag| tag.name }.join(", ") if product.tags
  end


    def logo
    logo_title = image_tag("rails.png")
    logo_ganti = "E-PPIKM"
    if @logo.nil?
      logo_ganti
    else
      "logo_title"
    end
    end
end

