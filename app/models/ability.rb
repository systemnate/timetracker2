class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, :all
      can :create, :all
      can :update, TaskDetail, user_id: user.id
      can :update, Task
      can :update, Client
      can :update, Priority
      can :update, Product
      can :update, Project
      can :update, Status
      can :update, User
    elsif user.viewer?
      can :read, :all
    end
  end
end
