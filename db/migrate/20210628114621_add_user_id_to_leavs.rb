class AddUserIdToLeavs < ActiveRecord::Migration[6.1]
  def change
    add_column :leavs, :user_id, :integer
  end
end
