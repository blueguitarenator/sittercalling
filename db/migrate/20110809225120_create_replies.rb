class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :answer
      t.string :note
      t.integer :event_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
