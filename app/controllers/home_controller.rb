class HomeController < ApplicationController
  before_filter :login_required

  def index
    set_current_segmented_name(:home)
  end

end
