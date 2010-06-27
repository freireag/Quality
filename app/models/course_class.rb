class CourseClass < ActiveRecord::Base
  WEEKDAYS = ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"]

  belongs_to :course
  belongs_to :city

  validates_presence_of :course, :start_time, :start_date, :end_date

  before_create :ensure_end_date_is_after_start_date
  after_create :generate_code

  def weekdays=(days)
    self.days_mask = days.inject(0) { |sum, d| sum + (2**WEEKDAYS.index(d)) }
  end

  def weekdays
    WEEKDAYS.reject do |d|
      ((days_mask || 0) & 2**WEEKDAYS.index(d)).zero?
    end
  end

  protected
  def ensure_end_date_is_after_start_date
    if end_date < start_date
      errors.add :end_date, "não pode ser menor que a data inicial."
      false
    end
  end

  def generate_code
    self.code = "#{self.course.code}.#{generate_3_numbered_id}-#{self.start_date.year}.#{self.city.code}"
    self.save
  end

  def generate_3_numbered_id
    if self.id < 10
      "00" + self.id.to_s
    elsif self.id < 100
      "0" + self.id.to_s
    else
      self.id.to_s
    end
  end
end
