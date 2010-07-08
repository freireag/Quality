class StudentAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Course
  end
end

