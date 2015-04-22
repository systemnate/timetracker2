class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, :all
      can :create, :all
      can :update, :all
    elsif user.viewer?
      can :read, :all
    end
  end
end