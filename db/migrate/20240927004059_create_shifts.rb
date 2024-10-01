class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.date :shift_date
      t.integer :shift_type
      t.references :user

      t.timestamps
    end
  end
end
