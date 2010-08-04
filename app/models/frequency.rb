class Frequency < ActiveRecord::Base
  belongs_to :course_class
  belongs_to :student

  named_scope :at_class, lambda {|class_id| {:conditions => {:course_class_id => class_id}}}
  named_scope :of_student, lambda {|student_id| {:conditions => {:student_id => student_id}}}
  named_scope :present, :conditions => {:presence => true}
end

