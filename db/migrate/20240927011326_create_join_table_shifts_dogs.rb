class CreateJoinTableShiftsDogs < ActiveRecord::Migration[7.0]
  def change
    create_join_table :shifts, :dogs do |t|
      t.index %i[shift_id dog_id]
    end
  end
end
