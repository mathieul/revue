# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def labeled_form_for(*args, &block)
    options = args.extract_options!.merge(:builder => LabeledFormBuilder)
    form_for(*(args.push(options)), &block)
  end
  
  def segmented_button(label, url, active, position)
    class_names = active == :active ? 'button active-' : 'button unactive-'
    class_names += position.to_s
    link_to(content_tag(:span, label), url, :class => class_names)
  end
end
