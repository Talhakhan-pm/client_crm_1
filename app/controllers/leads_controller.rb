class LeadsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @lead = Lead.new  
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    if current_user.agent? 
      if @lead.save
      flash[:notice]= "Your sales is processed for authorization"
      redirect_to leads_path
    else
      flash[:notice]= "Your lead has some issues"
      render :new, status: :unprocessable_entity
    end
  end
  end

  def edit
  end

  def update
  end

  private

  def lead_params
    params.require(:lead).permit!
  end
end
