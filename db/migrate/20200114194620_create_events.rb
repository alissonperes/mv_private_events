class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :creator_id
      t.string :location
      t.datetime :scheduled

      t.timestamps
    end

    add_index :events, :creator_id, unique: false
    add_index :events, :date, unique: false
    add_foreign_key :events, :users, column: :creator
  end
end
