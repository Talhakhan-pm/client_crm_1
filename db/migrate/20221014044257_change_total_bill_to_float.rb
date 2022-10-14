class ChangeTotalBillToFloat < ActiveRecord::Migration[7.0]
  def up
    change_table :leads do |t|
      t.change :total_bill, :decimal, using: 'total_bill::decimal'
    end
  end

  def down
    change_table :leads do |t|
      t.change :total_bill, :integer
    end
  end
end
