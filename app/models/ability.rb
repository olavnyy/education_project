# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # Define abilities for Superadmin
    if user.superadmin?
      can :manage, [Admin, School]

    # Define abilities for Admin
    elsif user.admin?
      can [:read, :update], School
      can :crud, [Group, Level, Student, Teacher,
                  Parent, News, Album, HealthInfo]

    # Define abilities for Teacher
    elsif user.teacher?
      can :read, [Student, Parent, HealthInfo]
      can [:create, :read, :update], [News, Album]

    # Define abilities for Parent
    elsif user.parent?
      can :read, [Student, Parent, HealthInfo, News, Album]
    end
  end
end
