class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false # added: ", default: false" because we want the default user to NOT have admin rights!
  end
end
