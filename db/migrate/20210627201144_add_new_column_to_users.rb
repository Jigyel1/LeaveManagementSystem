class AddNewColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :dob, :date
    add_column :users, :designation, :string
    add_column :users, :image, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
