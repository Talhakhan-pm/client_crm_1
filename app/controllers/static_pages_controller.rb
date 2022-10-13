class StaticPagesController < ApplicationController
  def dashboard
    if current_user.agent?
      @users = User.where(agent: true)
      render '_agent_dashboard'
      elsif current_user.admin?
        @users = User.where(agent: true)
        @billers= User.where(biller: true)
        render '_admin_dashboard'
      elsif current_user.biller
        @billers = User.where(biller: true)
        render '_biller_dashboard'
    end

  
  end

  def landing_page
  end
end
