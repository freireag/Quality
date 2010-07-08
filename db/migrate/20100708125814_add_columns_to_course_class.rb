class AddColumnsToCourseClass < ActiveRecord::Migration
  def self.up
    add_column :course_classes, :number, :integer
    add_column :course_classes, :end_time, :time
    add_column :course_classes, :observation, :text
  end

  def self.down
    remove_column :course_classes, :number
    remove_column :course_classes, :end_time
    remove_column :course_classes, :observation
  end
end

