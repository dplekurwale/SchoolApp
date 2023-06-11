class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :manage, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
      can :manage, Course
      can :manage, Batch
      can :manage, StudentBatch
      can :manage, Student, school_id: user.schools
      can [:update, :read], School, created_by_admin_user_id: user.id
    end
  end
end
