class Course < ActiveRecord::Base
  has_many :course_classes

  validates_presence_of :name, :code, :credit_hours, :price
  validates_uniqueness_of :code
  validates_numericality_of :credit_hours, :only_integer => true, :greater_than => 0
  validates_numericality_of :price, :greater_than_or_equal_to => 0

  validates_numericality_of :teoric_exams, :greater_than_or_equal_to => 0, :on => :update
  validates_inclusion_of :teoric_weight, :in => 0..10, :on => :update
  validates_numericality_of :practical_exams, :greater_than_or_equal_to => 0, :on => :update
  validates_inclusion_of :practical_weight, :in => 0..10, :on => :update
  validates_inclusion_of :other_weight, :in => 0..10, :on => :update

  before_update :ensure_weights_are_equal_or_less_than_10

  protected
  def ensure_weights_are_equal_or_less_than_10
    if self.teoric_weight + self.practical_weight + self.other_weight > 10
      errors.add_to_base "A soma dos pesos não deve ultrapassar 10"
      false
    end
  end
end

