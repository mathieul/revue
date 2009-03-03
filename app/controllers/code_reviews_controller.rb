class CodeReviewsController < ApplicationController
  before_filter :login_required
  
  def index
    @code_reviews = CodeReview.active
    set_current_segmented_name(:code_reviews)
  end
  
  def new
    @code_review = current_user.code_reviews.build
    set_current_segmented_name(:code_reviews)
  end
end
