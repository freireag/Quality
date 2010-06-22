class AddGradeModelToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :teoric_exams, :integer
    add_column :courses, :teoric_weight, :integer
    add_column :courses, :practical_exams, :integer
    add_column :courses, :practical_weight, :integer
    add_column :courses, :other_weight, :integer
  end

  def self.down
    remove_column :courses, :teoric_exams
    remove_column :courses, :teoric_weight
    remove_column :courses, :practical_exams
    remove_column :courses, :practical_weight
    remove_column :courses, :other_weight
  end
end

