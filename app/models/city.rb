class City < ActiveRecord::Base
  STATES = %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO]

  has_many :course_classes

  validates_presence_of :name, :state, :code
  validates_length_of :state, :maximum => 2
  validates_length_of :code, :maximum => 3
  validates_uniqueness_of :code


  named_scope :ordered_by_state, :order => "state, name ASC"

  def name_with_state
    "#{self.state} - #{self.name}"
  end
end

