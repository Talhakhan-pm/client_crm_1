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
class Lead < ApplicationRecord
  belongs_to :user
  validates :full_name, presence: true, on: :create
  validates :card_number, format: { with: /\A^[3456][0-9]{14,15}\Z/, message: "needs to start with 3, 4, 5 or 6" }
  validates :exp, format: { with: /(?:0[1-9]|1[0-2])\/[0-9]{2}/, message: "needs to be put in as MM / YY"}
  validates :cvv, numericality: {integer: true}
  validates :sale_amount, presence: true, numericality:  {greater_than: 49, less_than_or_equal_to: 999, message: "should be between $49 and $999"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  validates :pin_code, length:{ maximum: 4 }
  validates :account_number, presence: true


  enum descriptor: [ 'Discounted Bills' , 'Bill Square']
  enum bill_month: [ 'Past Due', 'Current Bill' , 'Complete Bill']
  enum provider: ['Spectrum', 'Xfinity' , 'Directv', 'Cox', 'Verizon', 'AT&T', 'Dish', 'Other']
  enum status: ['pending','charged', 'decline', 'refund', 'chargeback']
  enum bill_status: ['Pending','paid', 'account-error', 'reversed', 'Checked']
  # enum billing_status: ['Not Checked', 'Checked' ]
    
end
