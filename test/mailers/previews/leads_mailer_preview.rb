# Preview all emails at http://localhost:3000/rails/mailers/leads_mailer
class LeadsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/leads_mailer/lead_created
  def lead_created
    LeadsMailer.lead_created
  end

end
