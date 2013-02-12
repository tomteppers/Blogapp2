module ApplicationHelper

  def breadcrumbs
    content_tag(:ul, class: "breadcrumbs")  do
      rvalue = content_tag(:li, link_to("Home", root_path))
      rvalue << content_tag(:li, controller.controller_name) unless controller.controller_name == "blogs"
      rvalue
      end
  end
end
