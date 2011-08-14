class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :event_date, :null => false
      t.string :start_time, :null => false
      t.string :end_time, :null => false
      t.string :note
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
