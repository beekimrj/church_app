module ApplicationHelper
  def classes_for_active_menu(controller, action)
    return unless current_page?(controller:, action:)

    "active"
  end

  def menu_item(controller, action, menu_text = nil, url = nil, options = {})
    link_params = { controller:, action: }
    menu_text ||= if action.to_s.downcase == "index"
                    controller.to_s.titleize
    else
                    action.to_s.titleize
    end

    menu_classes = [ classes_for_active_menu(controller, action), "menu_item", options[:class] ].compact.join(" ")

    link_to(url || link_params, class: menu_classes) do
      create_icon(options[:icon]) + menu_text
    end
  end

  def create_icon(icon_name)
    icon_class = FontIconMapper.find(icon_name)
    tag.i(class: icon_class)
  end
end
