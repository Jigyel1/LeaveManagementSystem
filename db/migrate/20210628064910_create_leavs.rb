class CreateLeavs < ActiveRecord::Migration[6.1]
  def change
    create_table :leavs do |t|
      t.string :leave_type
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :reason
      t.integer :status
      t.string :feedback

      t.timestamps
    end
  end
end
