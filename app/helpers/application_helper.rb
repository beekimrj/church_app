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

    menu_classes = [ classes_for_active_menu(controller, action), options[:class] ].compact.join(" ")

    content_tag(:span, id: "menu_#{menu_text.downcase.underscore}", class: "menu_item") do
      link_to(url || link_params, class: menu_classes) do
        menu_icon_tag(options[:icon]) + menu_text
      end
    end
  end

  def menu_icon_tag(icon_class)
    return "" if icon_class.blank?

    content_tag(:i, "", class: "#{icon_class} menu_icon")
  end
end
