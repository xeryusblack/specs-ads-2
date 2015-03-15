class Officer < ActiveRecord::Base
	has_many :debt_settlements
end
