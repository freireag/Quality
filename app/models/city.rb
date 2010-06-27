class City < ActiveRecord::Base
  has_many :course_classes

  named_scope :ordered_by_state, :order => "state, name ASC"

  def name_with_state
    "#{self.state} - #{self.name}"
  end
end

