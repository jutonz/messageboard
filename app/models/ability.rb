class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    if user.admin?
      can :manage,  :all
    elsif user.logged_in? 
      can :read,    :all 
      can :update,  Post,    user_id: user.id
      can :destroy, Post,    user_id: user.id
      can :update,  Comment, user_id: user.id
      can :destroy, Comment, user_id: user.id
    else
      can :read,    :all 
    end
  end

end
