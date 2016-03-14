class Ability
  include CanCan::Ability 

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Product
      can :xls, Product
      can :manage, Product
    end
  end
end
