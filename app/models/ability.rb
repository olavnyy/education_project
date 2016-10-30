# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for Superadmin
    if user.superadmin?
      can :manage, :all

    # Define abilities for Admin
    elsif user.admin?
      can [:read, :update], School, id: user.school_id
      can :read, Group, school_id: user.school_id
      can :read, Level, school_id: user.school_id
      can :manage, Student, school_id: user.school_id
      can :read, Teacher, school_id: user.school_id
      can :read, Parent, school_id: user.school_id

    # Define abilities for Teacher
    elsif user.teacher?
      can :read, School, id: user.school_id
      can :read, Group, id: user.group_id
      can [:read, :update], Student, group_id: user.group_id

    # Define abilities for Parent
    elsif user.parent?
      can :read, School, id: user.school_id
      can :read, Student
    end
  end
end
