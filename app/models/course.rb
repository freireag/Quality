class Course < ActiveRecord::Base
  has_many :course_classes
  has_many :admin_files

  validates_presence_of :name, :code, :credit_hours, :price
  validates_uniqueness_of :code
  validates_numericality_of :credit_hours, :only_integer => true, :greater_than => 0
  validates_numericality_of :price, :greater_than_or_equal_to => 0
end

