class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  %w(text_field password_field check_box_field).each do |method_name|
    define_method(method_name) do |field_name, *args|
      @template.content_tag(:p, field_label(field_name, *args) + '<br />' + super +
        field_error(field_name))
    end
  end
  
  private
  
  def field_label(field_name, *args)
    options = args.extract_options!
    options.reverse_merge!(:required => field_required?(field_name))
    label_class = options[:required] ? 'required' : nil
    label(field_name, options[:label], :class => label_class)
  end

  def field_required?(field_name)
    object.class.reflect_on_validations_for(field_name).any? do |validation|
      validation.macro == :validates_presence_of
    end
  end
  
  def field_error(field_name)
    if object.errors.invalid?(field_name)
      first = [object.errors.on(field_name)].flatten.first
      @template.content_tag(:span,
        "#{field_name.to_s.humanize} #{first}", :class => 'inline_error')
    else
      ''
    end
  end
end