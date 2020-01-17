class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :event, foreign_key: true
      t.references :attendee, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :attendances, %i[event_id attendee_id], unique: true
  end
end
