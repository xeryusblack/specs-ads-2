class Ability

  include CanCan::Ability


  def initialize(officer_in_charge)

        officer_in_charge ||= OfficerInChrage.new # guest user
 
    if officer_in_charge.role? "Administrator"
      can :manage, :all #[Contingent, Competition, TrainingActivity, VarsityMember, TryoutIntent, AcquiredQuotaPoint, DebtSettlement, VarsityMember, OfficerInChrage]
    elsif officer_in_charge.role? "Office of Training and Varsity"
      can :manage, [Contingent, Competition, TrainingActivity, VarsityMember, TryoutIntent]
    elsif officer_in_charge.role? "Office of Finance"
      can :manage, [AcquiredQuotaPoint, DebtSettlement, VarsityMember]
      # manage products, assets he owns
      # can :manage, Product do |product|
      #   product.try(:owner) == user
      # end
      # can :manage, Asset do |asset|
      #   asset.assetable.try(:owner) == user
      # end
    else
      # Guest permissions
      can :read, :all
    end
  end
end
