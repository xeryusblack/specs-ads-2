class TrainingActivity < ActiveRecord::Base
	has_many :acquired_quota_points

	validates_presence_of :name, :message => "Can't be blank"
	#validates :name, :presence => { :message => "Cannot be blank!" }
	validates :name,length: { maximum: 30}
	validates :quota_point_value, presence: true, length: { maximum: 3 }, numericality: true

	validate :cannot_be_negative
	def cannot_be_negative
	 	if self.quota_point_value <= 0
	      errors.add(:quota_point_value, "Quantity must not be negative or zero!")
	    end
	    if self.name == nil
	    	errors.add(:name, "Field cannot be blank")
	    end
	end

	def to_s
		self.name
	end
end
