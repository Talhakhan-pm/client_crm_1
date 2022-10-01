class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.integer :provider, default: 0
      t.string :account_number
      t.string :total_bill
      t.integer :bill_month
      t.integer :status, default: 0
      t.string :name_on_card
      t.string :card_number
      t.string :exp
      t.string :cvv
      t.integer :descriptor, default: 0
      t.string :email
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
