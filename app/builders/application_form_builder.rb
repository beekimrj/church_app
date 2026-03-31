class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  # List the methods you want to override
  [ :text_field, :email_field, :password_field, :text_area, :select ].each do |method_name|
    define_method(method_name) do |method, options = {}, *args|
      # Call the original Rails helper
      input_html = super(method, options, *args)

      # Check for errors on this specific attribute
      errors = object.errors[method]

      if errors.any?
        error_message = @template.content_tag(:div, errors.first, class: "error-message")
        @template.content_tag(:div, input_html + error_message, class: "field-with-error")
      else
        input_html
      end
    end
  end

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    radio_html = super(method, collection, value_method, text_method, options, html_options, &block)

    errors = object&.errors&.[](method)

    radio_html = @template.content_tag(:div, radio_html, class: "form-row__radios")
    if errors&.any?
      error_tag = @template.content_tag(:div, errors.first, class: "error-message")
      radio_html + error_tag
    else
      radio_html
    end
  end
end
