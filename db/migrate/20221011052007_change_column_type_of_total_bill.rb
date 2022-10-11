class ChangeColumnTypeOfTotalBill < ActiveRecord::Migration[7.0]
  def up
    change_table :leads do |t|
      t.change :total_bill, :integer, using: 'total_bill::integer'
    end
  end

  def down
    change_table :leads do |t|
      t.change :total_bill, :string
    end
  end
end
