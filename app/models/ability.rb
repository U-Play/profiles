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
    can :manage, Team, :user_id => @user.id
  end

  alias_method :original_can?, :can?

  def can?(action, subject, *extra_args)
    if subject.class.name.match /^Presenters::/
      original_can?(action, subject.target, *extra_args)
    else
      original_can?(action, subject, *extra_args)
    end
  end

end
