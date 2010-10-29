class Notification < ActiveRecord::Base
  belongs_to :student
  
  validates_presence_of :student_id, :days
  validates_numericality_of :days, :greater_than => 0
  validates_uniqueness_of :student_id
end
