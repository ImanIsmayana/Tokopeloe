class AddAlamatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :alamat, :text
  end
end
