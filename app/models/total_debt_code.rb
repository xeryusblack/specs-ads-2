    # if competition.status == "Completed"   
    #   self.activity_members.each do |amember|
    	   
    #      competition = Competition.find(amember.competition_id)
    #      vm = VarsityMember.find(amember.varsity_member_id)
    #      if vm.debater_position == "Contingent Debater"

    #       temp = competition.arqp_contingent_debater - vm.total_acquired_quota_points
    #         if temp > 0 
    #             debt = temp * competition.quota_point_monetary_value
    #             debt_total = vm.total_debt + debt
    #             vm.update(:total_debt => debt_total)
    #         end
        
    #     elsif vm.debater_position == "Contingent Adjudicator"

    #           temp = competition.arqp_contingent_adjudicator - vm.total_acquired_quota_points
    #         if temp > 0 
    #             debt = temp * competition.quota_point_monetary_value
    #             debt_total = vm.total_debt + debt
    #             vm.update(:total_debt => debt_total)
    #         end

    #     elsif vm.debater_position == "Non-contingent"

    #           temp = competition.arqp_non_contingent - vm.total_acquired_quota_points
    #         if temp > 0 
    #             debt = temp * competition.quota_point_monetary_value
    #             debt_total = vm.total_debt + debt
    #             vm.update(:total_debt => debt_total)
    #         end
    #     end