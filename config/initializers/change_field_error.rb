# don't wrap hidden fields and labels when in error
# and use span instead of div, field_error class instead of fieldWithErrors
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  if html_tag =~ /type="hidden"/ || html_tag =~ /<label/
    html_tag
  else
    "<span class='field_error'>#{html_tag}</span>"
  end
end