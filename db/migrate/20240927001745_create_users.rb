class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, default: '', null: false
      t.boolean :is_manager, default: false
      t.timestamps
    end
  end
end
