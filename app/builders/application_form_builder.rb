class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  # Added date_field, time_field, number_field, and the correct text_area
  DYNAMIC_METHODS = [
    :text_field, :email_field, :password_field, :text_area,
    :select, :date_field, :time_field, :datetime_local_field,
    :number_field, :telephone_field, :url_field
  ].freeze

  DYNAMIC_METHODS.each do |method_name|
    define_method(method_name) do |method, options = {}, *args|
      input_html = super(method, options, *args)
      errors = object&.errors&.[](method)

      if errors.present?
        error_tag = @template.content_tag(:div, errors.first, class: "error-message")
        @template.content_tag(:div, input_html + error_tag, class: "field-with-error")
      else
        input_html
      end
    end
  end

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    radio_html = super(method, collection, value_method, text_method, options, html_options, &block)
    errors = object&.errors&.[](method)

    wrapped_radios = @template.content_tag(:div, radio_html, class: "form-row__radios")

    if errors.present?
      error_tag = @template.content_tag(:div, errors.first, class: "error-message")
      wrapped_radios + error_tag
    else
      wrapped_radios
    end
  end
end
