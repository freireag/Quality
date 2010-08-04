class CourseClass < ActiveRecord::Base
  WEEKDAYS = ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"]
  ENWEEKDAYS = %w[sunday monday tuesday wednesday thursday friday saturday]

  has_many :student_classes
  has_many :students, :through => :student_classes
  has_many :frequencies
  has_many :exams
  belongs_to :course
  belongs_to :city

  validates_presence_of :course, :start_time, :end_time, :start_date, :end_date, :number
  validates_numericality_of :number, :greater_than => 0

  before_create :ensure_end_date_is_after_start_date, :ensure_end_time_is_after_start_time
  after_create :generate_code

  def weekdays=(days)
    self.days_mask = days.inject(0) { |sum, d| sum + (2**WEEKDAYS.index(d)) }
  end

  def weekdays
    WEEKDAYS.reject do |d|
      ((days_mask || 0) & 2**WEEKDAYS.index(d)).zero?
    end
  end

  def running?
    self.start_date <= Date.today and self.end_date >= Date.today
  end

  def valid_day?(day)
    self.start_date <= day and self.end_date >= day and enweekdays.include?(day.strftime("%A").downcase)
  end

  protected
  def ensure_end_date_is_after_start_date
    if end_date < start_date
      errors.add :end_date, "não pode ser menor que a data inicial."
      false
    end
  end

  def ensure_end_time_is_after_start_time
    if end_time <= start_time
      errors.add :end_time, "não pode ser menor ou igual ao horário de início."
      false
    end
  end

  def generate_code
    self.code = "#{self.course.code}.#{generate_3_numbered_number}-#{self.start_date.year}.#{self.city.code}"
    self.save
  end

  def generate_3_numbered_number
    if self.number < 10
      "00" + self.number.to_s
    elsif self.number < 100
      "0" + self.number.to_s
    else
      self.number.to_s
    end
  end

  def enweekdays
    ENWEEKDAYS.reject do |d|
      ((days_mask || 0) & 2**ENWEEKDAYS.index(d)).zero?
    end
  end
end

