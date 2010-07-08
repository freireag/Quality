class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :funcionario
      can :read, AdminFile, :permission => 'funcionario'
      can :read, Course
      can :read, Student
    end
  end
end

