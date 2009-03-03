# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '916aa3b2e7c5ba20c0d3ef5435c6a14d'
  filter_parameter_logging :password

  private

  def set_current_segmented_name(name)
    @segmented_name = name
  end
end
