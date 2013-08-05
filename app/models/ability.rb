class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    guest
    registered_user if @user.persisted?
  end

  def guest
    can :read, :all
  end

  def registered_user
    can [:me, :manage], User, :id => @user.id
    can :manage, SportExperience, :user_id => @user.id
  end
end
