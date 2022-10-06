# == Schema Information
#
# Table name: leads
#
#  id             :integer          not null, primary key
#  full_name      :string
#  street         :string
#  city           :string
#  state          :string
#  zip            :string
#  provider       :integer          default("Spectrum")
#  account_number :string
#  total_bill     :string
#  bill_month     :integer
#  status         :integer          default("pending")
#  name_on_card   :string
#  card_number    :string
#  exp            :string
#  cvv            :string
#  descriptor     :integer          default("Discounted Bills")
#  email          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  phone          :string
#  sale_amount    :string
#  comments       :text
#
class Lead < ApplicationRecord
  belongs_to :user

  enum descriptor: [ 'Discounted Bills' , 'Bill Square']
  enum bill_month: [ 'Past Due', 'Current Bill' , 'Complete Bill']
  enum provider: ['Spectrum', 'Xfinity' , 'Directv', 'Cox', 'Verizon']
  enum status: ['pending','charged', 'refund', 'chargeback']

  validates :full_name, presence: true
  validates :card_number, presence: true
    
end
