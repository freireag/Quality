class Student < ActiveRecord::Base
  MARITAL_STATUS = {:casado => "Casado(a)", :divorciado => "Divorciado(a)", :solteiro => "Solteiro(a)", :viuvo => "Viúvo(a)"}
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
end

