class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    #add_column :users, :password_digest, :string
    rename_column :Customers, :password, :password_digest
  end
end
