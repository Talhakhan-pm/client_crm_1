class AddFieldsToLeadsForPhoneAndSsn < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :ssn, :string
    add_column :leads, :pin_code, :string
    add_column :leads, :bill_status, :integer, default: 0
    add_column :leads, :bill_check_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
