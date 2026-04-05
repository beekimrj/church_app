module ApplicationHelper
  def classes_for_active_menu(controller, action)
    "active" if controller_path.start_with?(controller.to_s)
  end

  def menu_item(controller, action, menu_text = nil, url = nil, options = {})
    link_params = { controller: "/#{controller}", action: action }
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

  def display_time(value, format: :time)
    display_datetime(value, format: format)
  end

  def display_date(value, format: :default)
    return I18n.translate("show.blank_value") if value.nil?

    I18n.localize(value, format: format)
  end

  def display_datetime(value, format: :default)
    return I18n.translate("show.blank_value") if value.nil?

    I18n.localize(value, format: format)
  end

  def nested_dom_id(*args)
    args.map do |arg|
      arg.respond_to?(:to_key) ? dom_id(arg) : arg.to_s
    end.join("_")
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
