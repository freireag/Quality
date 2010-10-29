class Student < ActiveRecord::Base
  MARITAL_STATUS = {:casado => "Casado(a)", :divorciado => "Divorciado(a)", :solteiro => "Solteiro(a)", :viuvo => "Viúvo(a)"}

  has_many :student_classes
  has_many :course_classes, :through => :student_classes
  has_many :courses, :through => :course_classes
  has_many :frequencies
  has_many :grades
  has_many :exams, :through => :grades
  has_one :notification

  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable, :registerable, :validatable and :activatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :authentication_keys => [:cpf]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :cpf, :rg, :phone, :birthplace, :birthdate, :marital_status

  validates_presence_of :name, :phone, :rg, :cpf, :birthplace, :birthdate, :marital_status
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true
  validates_uniqueness_of :cpf
  #validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..20, :allow_blank => true
  
  def self.search(query)
    if query
      self.find(:all, :conditions => "name LIKE '%#{query}%'")
    else
      self.all
    end
  end

  def is_registered?(course_class)
    self.course_classes.map(&:id).include? course_class.id
  end

  def grade(exam_id)
    Grade.find(:first, :conditions => ["student_id = :s AND exam_id = :e", {:s => self.id, :e => exam_id}])
  end
  
  def final_grade(course_class)
    grades = Grade.of_class(course_class.id).of_student(self.id)
    theoric_grades = grades.theoric.map(&:grade)
    if theoric_grades.count == 0
      theoric_average = 0
    else
      theoric_sum = theoric_grades.inject { |sum,g| sum + g }
      theoric_average = theoric_sum / theoric_grades.count
    end
    practical_grades = grades.practical.map(&:grade)
    if practical_grades.count == 0
      practical_average = 0
    else
      practical_sum = practical_grades.inject { |sum,g| sum + g }
      practical_average = practical_sum / practical_grades.count
    end
    concept_grade = grades.concept.first.try(:grade)
    concept_grade = 0  if concept_grade == nil
    final_grade = theoric_average * 0.3 + practical_average * 0.6 + concept_grade * 0.1
    final_grade
  end

  def courses
    Course.find(self.course_classes.map(&:course_id))
  end

  def files(course_class)
    AdminFile.find(:all, :conditions => ["course_id = ?", course_class.course.id])
  end
end

