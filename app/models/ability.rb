class Ability
  include CanCan::Ability

  def initialize(friend)
    # debugger
    # can :create, Application
    # can :read, Application, user: user
    # can :update, Application, user: user
    # can :read, Student, user: user
    # can :read, Friend
    can :manage, :all
    # cannot :create, Student if user.teacher?

  end
end