class Frequency < ActiveRecord::Base
  belongs_to :course_class
  belongs_to :student
end
