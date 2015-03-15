class ActivityMember < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :acquired_quota_point
	belongs_to :competition
	
	validates :varsity_member_id, presence: :true
	validate :cannot_be_negative

	#accepts_nested_attributes_for :varsity_members

	def cannot_be_negative
	 	if self.round <= 0
	      errors.add(:round, "Number of rounds must not be negative or zero!")
	    end
	end

end
