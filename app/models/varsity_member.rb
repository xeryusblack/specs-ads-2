class VarsityMember < ActiveRecord::Base
		TRACK = ["Debater", "Adjudicator", "Debater and Adjudicator"]
	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]

	validates :vm_id, presence: true, length: { is: 6 }, :uniqueness => { :message => "ID number already exist" }, numericality: true
	validates :first_name, presence: true, length: { maximum: 30}
	validates :last_name, presence: true, length: { maximum: 30}
	validates :year, presence: true, length: { is: 1 }
	validates :course, presence: true, length: { maximum: 15 }
	validates :contact_number, presence: true, length: { is: 11 }
	validates :email_address, presence: true, length: { maximum: 40 }
	validates :varsity_track, presence: true, length: { maximum: 15 }, inclusion: { in: TRACK }
	validates :debater_position, presence: true, length: { maximum: 23 }, inclusion: { in: POSITION }
	validates :total_debt, length: { maximum: 7 }, numericality: true
	validates :total_acquired_quota_points, length: { maximum: 3 }, numericality: true

	has_many :debt_settlements
	has_many :competition_debts
	has_many :acquired_quota_points, through: :activity_members
	has_many :activity_members
	has_many :tryout_intents
	has_many :competitons, through: :competition_debts

	validate :cannot_be_wrong

	def cannot_be_wrong
	 	if self.contact_number.length != 11
	      errors.add(:contact_number, "Must contain valid cellphone number! (11 digits)")
	    end

	    if self.vm_id > 999999
	      errors.add(:vm_id, "Must contain valid ID Number (6 digits)")
	    end
	end


	def to_s
		self.first_name + " " + self.last_name
	end

	# def calculate_total_debt
	# 	competition = Competition.find(self.competition_id)
	# 	vm = VarsityMember.find(self.varsity_member_id)

	# 	position = vm.debater_positon

		

	# 	competiton.avm.total_acquired_quota_points 
	# 	money = competition.quota_point_monetary_value


	# 	selfVarsityMember.all.each do |member|
	# 		member.total_debt = member.total_debt + (member.total_acquired_quota_points * member.competitons
	# 	end
	# end

	
end
