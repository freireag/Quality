class CreateFrequencies < ActiveRecord::Migration
  def self.up
    create_table :frequencies do |t|
      t.date :day
      t.belongs_to :course_class
      t.belongs_to :student
      t.boolean :presence

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencies
  end
end
