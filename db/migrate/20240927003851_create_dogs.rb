class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name, default: '', null: false
      t.string :breed, default: ''
      t.references :customer
      t.integer :status, default: 0, null: false
      t.text :days_of_week, array: true, default: []
      t.text :time_period, array: true, default: []
      t.timestamps
    end
  end
end
