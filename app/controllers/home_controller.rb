class HomeController < ApplicationController
	# before_filter :require_user
  before_filter :authenitcate_heroku

  def index
  end

end
