# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for Superadmin
    if user.superadmin?
      can :manage, :all

    # Define abilities for Admin
    elsif user.admin?
      can :read, School, id: user.school_id
      can :crud, Group, school_id: user.school_id
      can :crud, Level, school_id: user.school_id
      can :crud, Student, school_id: user.school_id
      can :crud, Teacher, school_id: user.school_id
      can :crud, Parent, school_id: user.school_id

    # Define abilities for Teacher
    elsif user.teacher?
      can :read, School, id: user.school_id
      can :read, Group, id: user.group_id
      can :read, Student, group_id: user.group_id

    # Define abilities for Parent
    elsif user.parent?
      can :read, School, id: user.school_id
    end
  end
end
