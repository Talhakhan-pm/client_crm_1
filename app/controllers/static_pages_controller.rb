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

  def stats
    @charged_sales_last_month = current_user.leads.where(created_at: 2.months.ago..1.month.ago, status: 'charged').sum(:sale_amount).to_f
    @charged_sales_this_month = current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'charged').sum(:sale_amount)
    @difference_in_sales= (@charged_sales_this_month.to_f - @charged_sales_last_month.to_f)
    @fraction_change = @difference_in_sales/@charged_sales_last_month
    @percentage_change = @fraction_change * 100
    

    @chargebacks_this_month = current_user.leads.where(created_at: 1.month.ago..Time.now, status: 'chargeback').count.to_f
    @chargebacks_last_month =  current_user.leads.where(created_at: 2.months.ago..1.month.ago, status: 'chargeback').count.to_f
    @charged_sales_count = current_user.leads.where(created_at: 1.month.ago..Time.now, status: 'charged').count.to_f
    @charged_sales_last_count = current_user.leads.where(created_at: 2.months.ago..1.month.ago, status: 'charged').count.to_f


    @percentage_chargebacks_in_this_month = (@chargebacks_this_month/@charged_sales_count) * 100 

  end
end
