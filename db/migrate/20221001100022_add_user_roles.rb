class AddUserRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, :default => 0
    add_column :users, :agent, :boolean, :default => 0
    add_column :users, :biller, :boolean, :default => 0
    add_column :users, :authorization, :boolean, :default => 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
