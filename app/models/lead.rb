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
end
