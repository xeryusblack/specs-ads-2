class AcquiredQuotaPoint < ActiveRecord::Base
	has_many :varsity_members, through: :activity_members
  belongs_to :training_activity
	has_many :activity_members
	accepts_nested_attributes_for :activity_members


	#validates :amount, length: { maximum: 3 }, numericality: true
	validates :date_conducted, presence: true

	#validate :cannot_be_negative

	#accepts_nested_attributes_for :varsity_members

	# def cannot_be_negative
	#  	if self.amount <= 0
	#       errors.add(:amount, "Quantity must not be negative or zero!")
	#     end
	# end

	before_validation :load_default

	 def load_default
   		if self.new_record?
   			self.amount = 0
      end
   end


	#after_create :update_varisty_member_total_debt

	def update_varisty_member_quota_point

    	sum = 0
    	#vm = VarsityMember.find(self.varsity_member_id)
      self.varsity_members.each do |member|
    	#vm.acquired_quota_points.each do |point|
       		sum = member.total_acquired_quota_points + self.amount
            member.update(:total_acquired_quota_points => sum)
        end
    

	end

	before_create :calculate_amount

	def calculate_amount

    	sum = 0
      total = 0
    	ta = TrainingActivity.find(self.training_activity_id)
    	#am = ActivityMember.find(self.training_activity_id)
    	#vm = VarsityMember.find(self.varsity_member_id)
        #self.varsity_member_id = am.varsity_member_id

      self.activity_members.each do |amember|
    	   
            sum = ta.quota_point_value * amember.round
            #self.varsity_members.each do |vmember|
            vm = VarsityMember.find(amember.varsity_member_id)
                aqp_total = vm.total_acquired_quota_points + sum
                vm.update(:total_acquired_quota_points => aqp_total)
    
    	   #self.amount = sum
      end

    	
    	# AcquiredQuotaPoint.activity_members.each do |member|
     #    	sum = user.total_purchases + self.total_amount
    	# end
     #   	sum = ta.quota_point_value * self.amount
    
      	#user.update(:total_acquired_quota_points => sum)
	end

  def displayAmount(member_id, training_id)
      TrainingActivity.find(self.training_activity_id).quota_point_value * ActivityMember.find(member_id).round
  end


end
