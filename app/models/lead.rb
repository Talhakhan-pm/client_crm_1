# == Schema Information
#
# Table name: leads
#
#  id             :integer          not null, primary key
#  full_name      :string /
#  street         :string /
#  city           :string /
#  state          :string/
#  zip            :string/
#  provider       :integer/          default(0)
#  account_number :string/
#  total_bill     :string/
#  bill_month     :integer/
#  status         :integer       default(0)
#  name_on_card   :string/
#  card_number    :string/
#  exp            :string/
#  cvv            :string/
#  descriptor     :integer/          default(0)
#  email          :string/
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Lead < ApplicationRecord
  belongs_to :user

  enum descriptor: [ 'Discounted Bills' , 'Bill Square']
  enum bill_month: [ 'Past Due', 'Current Bill' , 'Complete Bill']
  enum provider: ['Spectrum', 'Xfinity' , 'Directv', 'Cox', 'Verizon']
  enum status: {pending: 0, charged: 1, refund: 2, chargeback: 3}

  validates :full_name, presence: true
end
