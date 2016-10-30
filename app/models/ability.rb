# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # Define abilities for Superadmin
    if user.superadmin?
      can :manage, :all

    # Define abilities for Admin
    elsif user.admin?
      can [:read, :update], School
      can :crud, Group
      can :crud, Level
      can :crud, Student
      can :crud, Teacher
      can :crud, Parent
      can :crud, News
      can :crud, Album

    # Define abilities for Teacher
    elsif user.teacher?

      can :read, School
      can :read, Group
      can :read, Level
      can :read, Student
      can :read, News
      can :read, Album

    # Define abilities for Parent
    elsif user.parent?
      can :read, School
      can :read, Student
      can :read, Group
      can :read, Level
      can :read, Teacher
      can :read, News
      can :read, Album
    end
  end
end
