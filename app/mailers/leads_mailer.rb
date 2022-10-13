class LeadsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.leads_mailer.lead_created.subject
  #
  def lead_created
    @user = params[:user]
    @lead = params[:lead]
    @greeting = "Hi"

    mail to: @lead.email, subject: "Bill Payment"
  end
end
