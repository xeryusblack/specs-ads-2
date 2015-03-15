class Contingent < ActiveRecord::Base
	belongs_to :competition
	belongs_to :varsity_member

	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]
end
