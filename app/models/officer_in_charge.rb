class OfficerInCharge < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_and_belongs_to_many :roles

    def role?(role)
    	if Role.find(self.role_id).name == role
    		return true
    	else
    		return false
    	end
    	#return !!self.roles.find_by_name(role.to_s.camelize)
	end
end
