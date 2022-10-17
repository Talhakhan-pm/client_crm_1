class StaticPagesController < ApplicationController
  def dashboard
    if current_user.agent?
      @users = User.where(agent: true)
      render 'stats'
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
    @charged_sales_this_month = current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'charged').sum(:sale_amount).to_f
    @difference_in_sales= (@charged_sales_this_month.to_f - @charged_sales_last_month.to_f)
    @fraction_change = @difference_in_sales/@charged_sales_last_month
    @percentage_change = @fraction_change * 100
    @pending_sales_count= current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'pending').count
    @declined_sales_count= current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'decline').count
    @declined_sales_total= current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'decline').sum(:sale_amount).to_f
    @pending_sales_total= current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'pending').sum(:sale_amount)
    @total_refunds_this_month = current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'refund').sum(:sale_amount)
    @total_refunds_this_month_count = current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'refund').count
    @chargebacks_this_month_total = current_user.leads.where(created_at: 1.months.ago..Time.now, status: 'chargeback').sum(:sale_amount)
    @chargebacks_this_month = current_user.leads.where(created_at: 1.month.ago..Time.now, status: 'chargeback').count.to_f
    @chargebacks_last_month =  current_user.leads.where(created_at: 2.months.ago..1.month.ago, status: 'chargeback').count.to_f
    @charged_sales_count = current_user.leads.where(created_at: 1.month.ago..Time.now, status: 'charged').count.to_f
    @charged_sales_last_count = current_user.leads.where(created_at: 2.months.ago..1.month.ago, status: 'charged').count.to_f
    @net_sales = @charged_sales_this_month - @chargebacks_this_month_total - @total_refunds_this_month
    @average_sale_per_transcation = current_user.leads.average(:sale_amount).round(2)
    @percentage_chargebacks_in_this_month = (@chargebacks_this_month/@charged_sales_count) * 100 
  end
end
