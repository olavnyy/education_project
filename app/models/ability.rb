# Define permissions for all users
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # Define abilities for Superadmin
    if user.type?('Superadmin')
      can :manage, [Admin, School]

    # Define abilities for Admin
  elsif user.type?('Admin')
      can [:read, :update], School
      can :crud, [Group, Level, Student, Teacher,
                  Parent, News, Album, HealthInfo]

    # Define abilities for Teacher
  elsif user.type?('Teacher')
      can :read, [Student, Parent, HealthInfo]
      can [:create, :read, :update], [News, Album]
      can :crud, [Attendance, Journal, ReportTime]

    # Define abilities for Parent
  elsif user.type?('Parent')
      can :read, [Student, Parent, HealthInfo, News, Album]
    end
  end
end
