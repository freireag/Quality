class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :student_id
      t.date :last_sended
      t.integer :days

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
