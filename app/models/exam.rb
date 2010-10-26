class Exam < ActiveRecord::Base
  TYPES = %w[teórica prática]

  default_scope :order => :exam_order

  has_many :grades
  has_many :students, :through => :grades
  belongs_to :course_class

  validates_presence_of :exam_type, :name, :exam_order
  validates_numericality_of :exam_order, :greater_than => 0
  validates_uniqueness_of :exam_order, :scope => [:course_class_id, :exam_type]
  
  named_scope :theoric, :conditions => {:exam_type => "teórica"}
  named_scope :practical, :conditions => {:exam_type => "prática"}
  named_scope :concept, :conditions => {:exam_type => "conceito"}
end

