class AddNoPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nophone, :string
  end
end
