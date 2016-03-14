class Ability
  include CanCan::Ability 

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Product
    end
  end
end