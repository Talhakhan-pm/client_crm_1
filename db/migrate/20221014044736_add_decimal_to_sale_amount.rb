class AddDecimalToSaleAmount < ActiveRecord::Migration[7.0]
  def up
    change_table :leads do |t|
      t.change :sale_amount, :decimal, using: 'sale_amount::decimal'
    end
  end

  def down
    change_table :leads do |t|
      t.change :sale_amount, :integer
    end
  end
end
