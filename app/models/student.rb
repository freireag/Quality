class Student < ActiveRecord::Base
  MARITAL_STATUS = {:casado => "Casado(a)", :divorciado => "Divorciado(a)", :solteiro => "Solteiro(a)", :viuvo => "Viúvo(a)"}

  has_many :student_classes
  has_many :course_classes, :through => :student_classes
  has_many :courses, :through => :course_classes
  has_many :frequencies
  has_many :grades
  has_many :exams, :through => :grades

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

  def is_registered?(course_class)
    self.course_classes.map(&:id).include? course_class.id
  end

  def grade(exam_id)
    Grade.find(:first, :conditions => ["student_id = :s AND exam_id = :e", {:s => self.id, :e => exam_id}])
  end

  def courses
    Course.find(self.course_classes.map(&:course_id))
  end

  def files(course_class)
    AdminFile.find(:all, :conditions => ["course_id = ?", course_class.course.id])
  end
end

