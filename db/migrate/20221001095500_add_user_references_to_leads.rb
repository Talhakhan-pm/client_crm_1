class AddUserReferencesToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :user_id, :int, foreign_key: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
