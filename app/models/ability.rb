# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for Superadmin
    if user.superadmin?
      can :manage, :all

    # Define abilities for Admin
    elsif user.admin?
      can [:read, :update], School
      can :read, Group
      can :read, Level
      can [:read, :update], Student
      can :read, Teacher
      can :read, Parent

    # Define abilities for Teacher
    elsif user.teacher?
      can :read, School
      can :read, Group
      can :read, Level
    can [:read, :update], Student

    # Define abilities for Parent
    elsif user.parent?
      can :read, School
      can :read, Student
      can :read, Group
      can :read, Level
      can :read, Teacher
    end
  end
end
