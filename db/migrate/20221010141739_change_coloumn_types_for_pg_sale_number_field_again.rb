class ChangeColoumnTypesForPgSaleNumberFieldAgain < ActiveRecord::Migration[7.0]
  def up
    change_table :leads do |t|
      t.change :sale_amount, :integer, using: 'sale_amount::integer'
    end
  end

  def down
    change_table :leads do |t|
      t.change :sale_amount, :string
    end
  end
end
