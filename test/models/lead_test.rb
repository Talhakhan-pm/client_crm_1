# == Schema Information
#
# Table name: leads
#
#  id              :integer          not null, primary key
#  full_name       :string
#  street          :string
#  city            :string
#  state           :string
#  zip             :string
#  provider        :integer          default("Spectrum")
#  account_number  :string
#  total_bill      :decimal(, )
#  bill_month      :integer
#  status          :integer          default("pending")
#  name_on_card    :string
#  card_number     :string
#  exp             :string
#  cvv             :string
#  descriptor      :integer          default("Discounted Bills")
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  phone           :string
#  sale_amount     :decimal(, )
#  comments        :text
#  ssn             :string
#  pin_code        :string
#  bill_status     :integer          default("Pending")
#  bill_check_date :datetime
#  biller_comment  :string
#  input           :string
#
require "test_helper"

class LeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
