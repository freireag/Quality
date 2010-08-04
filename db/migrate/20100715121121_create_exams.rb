class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.string :exam_type
      t.string :name
      t.integer :exam_order
      t.belongs_to :course_class

      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end

