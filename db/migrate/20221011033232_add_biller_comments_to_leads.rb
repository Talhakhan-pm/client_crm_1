class AddBillerCommentsToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :biller_comment, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
