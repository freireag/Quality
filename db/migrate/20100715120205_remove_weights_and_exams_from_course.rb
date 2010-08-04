class RemoveWeightsAndExamsFromCourse < ActiveRecord::Migration
  def self.up
    remove_column :courses, :teoric_weight
    remove_column :courses, :teoric_exams
    remove_column :courses, :practical_weight
    remove_column :courses, :practical_exams
    remove_column :courses, :other_weight
  end

  def self.down
    add_column :courses, :teoric_weight, :integer
    add_column :courses, :teoric_exams, :integer
    add_column :courses, :practical_weight, :integer
    add_column :courses, :practical_exams, :integer
    add_column :courses, :other_weight, :integer
  end
end

