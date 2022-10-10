class LeadsController < ApplicationController

  def index
    @leads = policy_scope(Lead).where("card_number LIKE ?", "%#{params[:filter]}%").all
    authorize @leads
  end

  def show
  end

  def new
    @lead = Lead.new  
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    if current_user.agent? || current_user.admin 
      @lead.save
      flash[:notice]= "Your sales is processed for authorization"
      redirect_to leads_path
    else
      # flash.now[:alert]= "Please contact your administrator"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = Lead.find(params[:id])
    authorize @lead
  end

  def update
    @lead = Lead.find(params[:id])
    if current_user.authorization || current_user.agent
    if @lead.update!(lead_params)
      flash[:notice]= "Lead has been updated"
      redirect_to leads_path
    else
      flash.now[:alert]= "Please contact your Manager"
      render :edit, status: :unprocessable_entity
    end
  end 

  end

  private

  def lead_params
    params.require(:lead).permit!
  end

  def update_params
    params.require(:lead).permit(
      :status
    )
  end

end
