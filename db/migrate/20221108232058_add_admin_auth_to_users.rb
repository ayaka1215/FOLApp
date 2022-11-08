class AddAdminAuthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_auth, :integer
  end
end
