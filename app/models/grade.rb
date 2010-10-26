class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :exam

  validates_presence_of :exam_id, :student_id, :grade
  validates_uniqueness_of :student_id, :scope => :exam_id
  validates_numericality_of :grade, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10
  
  named_scope :of_student, lambda {|student_id| {:conditions => {:student_id => student_id}}}
  named_scope :of_class, lambda {|course_class_id| {:joins => :exam, :conditions => {"exams.course_class_id" => course_class_id}}}
  named_scope :theoric, :joins => :exam, :conditions => {"exams.exam_type" => "teórica"}
  named_scope :practical, :joins => :exam, :conditions => {"exams.exam_type" => "prática"}
  named_scope :concept, :joins => :exam, :conditions => {"exams.exam_type" => "conceito"}
end

