class StudentClass < ActiveRecord::Base
  belongs_to :student
  belongs_to :course_class
end
