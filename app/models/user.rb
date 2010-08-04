class User < ActiveRecord::Base
  ROLES = %w[admin inspetor]

  has_many :admin_files

  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable, :validatable, :registerable and :activatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :login, :email, :password, :password_confirmation, :role

  validates_presence_of :name
  validates_presence_of :login
  validates_uniqueness_of :login
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..20, :allow_blank => true
  #validates_presence_of :current_password, :on => :update

  def role?(role)
    self.role == role.to_s
  end
end

