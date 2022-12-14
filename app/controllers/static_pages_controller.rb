class StaticPagesController < ApplicationController
  def dashboard
    if current_user.agent?
      @users = User.where(agent: true)
      render 'stats'
      elsif current_user.admin?
        @user = Lead.where(status: 'charged')
        @users = User.where(agent: true)
        @billers= User.where(biller: true)
        render '_admin_dashboard'
      elsif current_user.biller
        @billers = User.where(biller: true)
        render '_biller_dashboard'
      elsif current_user.authorization
        @users = User.where(agent: true)
        render '_authorization'
    end

  
  end

  def stats
  end

  def per_day
    @charged_sales_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'charged').sum(:sale_amount).to_f
    @chargebacks_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'chargeback').sum(:sale_amount).to_f
    @refunds_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'refund').sum(:sale_amount).to_f
    @net_sale_today = @charged_sales_today - @chargebacks_today - @refunds_today
    @average_sale_per_transcation_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'charged').average(:sale_amount)
    @declined_sales_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'decline').sum(:sale_amount).to_f
    @declined_sales_today_count = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'decline').count
    @trasactions_today = current_user.leads.where(created_at: 1.day.ago..Time.now).count
    @chargebacks_today_count = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'chargeback').count
    @refunds_today_count = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'refund').count
    @pending_sales_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'pending').sum(:sale_amount).to_f
    @pending_sales_count_today = current_user.leads.where(created_at: 1.day.ago..Time.now, status: 'pending').count
  end

  def per_seven_days
    @charged_sales_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'charged').sum(:sale_amount).to_f
    @chargebacks_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'chargeback').sum(:sale_amount).to_f
    @refunds_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'refund').sum(:sale_amount).to_f
    @net_sale_seven_days = @charged_sales_seven_days - @chargebacks_seven_days - @refunds_seven_days
    @average_sale_per_transcation_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'charged').average(:sale_amount)
    @declined_sales_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'decline').sum(:sale_amount).to_f
    @declined_sales_seven_days_count = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'decline').count
    @trasactions_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now).count
    @chargebacks_seven_days_count = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'chargeback').count
    @refunds_seven_days_count = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'refund').count
    @pending_sales_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'pending').sum(:sale_amount).to_f
    @pending_sales_count_seven_days = current_user.leads.where(created_at: 7.days.ago..Time.now, status: 'pending').count
  end

  def per_thirty_days
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
    @average_sale_per_transcation = current_user.leads.where(created_at: 1.month.ago..Time.now, status: 'charged').average(:sale_amount)
    @percentage_chargebacks_in_this_month = (@chargebacks_this_month/@charged_sales_count) * 100 
  end
end
