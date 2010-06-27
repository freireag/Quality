class CreateCourseClasses < ActiveRecord::Migration
  def self.up
    create_table :course_classes do |t|
      t.time :start_time
      t.date :start_date
      t.date :end_date
      t.references :course
      t.references :city

      t.timestamps
    end
  end

  def self.down
    drop_table :course_classes
  end
end
