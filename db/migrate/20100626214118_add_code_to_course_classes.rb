class AddCodeToCourseClasses < ActiveRecord::Migration
  def self.up
    add_column :course_classes, :code, :string
  end

  def self.down
    remove_column :course_classes, :code
  end
end

