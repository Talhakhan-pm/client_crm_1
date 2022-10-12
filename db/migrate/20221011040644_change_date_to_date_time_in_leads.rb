class ChangeDateToDateTimeInLeads < ActiveRecord::Migration[7.0]
    def up
      change_table :leads do |t|
        t.change :bill_check_date, :string, using: 'bill_check_date::string'
      end
    end
  
    def down
      change_table :leads do |t|
        t.change :bill_check_date, :date
      end
    end
end
