class DebtSettlement < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :officer_in_charge

	validates :amount_paid, length: { maximum: 6 }, numericality: true
	validates :date_paid, presence: true

	validate :cannot_be_negative

	def cannot_be_negative
	 	if self.amount_paid <= 0
	      errors.add(:amount_paid, "Quantity must not be negative or zero!")
	    end
	end

	before_validation :load_officer

	def load_officer
		self.officer_id = current_officer_in_charge.id
  end

	after_create :update_varisty_member_quota_point

	def update_varisty_member_quota_point

    	sum = 0
    	vm = VarsityMember.find(self.varsity_member_id)

       	sum = vm.total_acquired_quota_points - self.amount_paid
    
      	user.update(:total_acquired_quota_points => sum)
	end
end
