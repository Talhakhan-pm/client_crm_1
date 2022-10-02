class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def logged_in?
    !!current_user
  end
end
