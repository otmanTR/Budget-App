class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    can :manage, Group, user_id: user.id if user.present?
    can :manage, Entity, author_id: user.id if user.present?
  end
end
