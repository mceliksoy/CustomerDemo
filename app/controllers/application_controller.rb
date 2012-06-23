class ApplicationController < ActionController::Base
  protect_from_forgery
  
# Override the Rails behavior to always display the error messages 
# in front of each of the form fields with errors.
 
#   ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#    
#    puts html_tag.to_s
#    puts instance.to_s
#    
#    if instance.error_message.kind_of?(Array)
#      %(#{html_tag}<span class="validation-error">&nbsp;
#      {instance.error_message.join(',')}</span>##).html_safe
#    else
#      %(#{html_tag}<span class="validation-error">&nbsp;
#      {instance.error_message}</span>##).html_safe
#    end
#  end

end
