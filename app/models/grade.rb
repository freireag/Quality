class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam

  validates_presence_of :exam_id, :student_id, :grade
  validates_uniqueness_of :student_id, :scope => :exam_id
  validates_numericality_of :grade, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10
end

