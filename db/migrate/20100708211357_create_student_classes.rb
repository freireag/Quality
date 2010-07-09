class CreateStudentClasses < ActiveRecord::Migration
  def self.up
    create_table :student_classes do |t|
      t.belongs_to :student
      t.belongs_to :course_class

      t.timestamps
    end
  end

  def self.down
    drop_table :student_classes
  end
end
