class RemoveColumnFromLead < ActiveRecord::Migration[7.0]
  def change
    remove_column :leads, :users_id
  end
end
