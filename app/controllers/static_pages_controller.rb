class StaticPagesController < ApplicationController
  def dashboard
    @users = User.where(agent: true, authorization: false, admin: false)
  end

  def landing_page
  end
end
