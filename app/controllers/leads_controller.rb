class LeadsController < ApplicationController

  def index
    @leads = Lead.where("email LIKE ?", "%#{params[:filter]}%").all
  end

  def show
  end

  def new
    @lead = Lead.new  
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    if current_user.agent? && @lead.save
      flash[:notice]= "Your sales is processed for authorization"
      redirect_to leads_path
    else
      flash.now[:alert]= "Please contact your administrator"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update(update_params)
      flash[:notice]= "Lead has been updated"
      redirect_to leads_path
    else
      flash[:alert]= "Please contact your Manager"
      render :edit, status: :unprocessable_entity
    end

  end

  private

  def lead_params
    params.require(:lead).permit!
  end

  def update_params
    params.require(:lead).permit(
      :full_name,
      :street,
      :provider,
      :account_number,
      :total_bill,
      :bill_month,
      :descriptor
    )
  end

end
