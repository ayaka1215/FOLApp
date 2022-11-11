class RemoveAdminAuthFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin_auth, :integer
  end
end
