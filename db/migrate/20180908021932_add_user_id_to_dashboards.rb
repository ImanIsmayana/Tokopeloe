class AddUserIdToDashboards < ActiveRecord::Migration[5.2]
  def change
    add_column :dashboards, :user_id, :integer
  end
end
