class Role < ActiveRecord::Base
	has_and_belongs_to_many :officer_in_charges

end
