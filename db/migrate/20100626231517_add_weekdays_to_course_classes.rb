class AddWeekdaysToCourseClasses < ActiveRecord::Migration
  def self.up
    add_column :course_classes, :days_mask, :integer
  end

  def self.down
    remove_column :course_classes, :days_mask
  end
end

