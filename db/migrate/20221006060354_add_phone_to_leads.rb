class AddPhoneToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :phone, :string
    add_column :leads, :sale_amount, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
