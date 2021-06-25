class ApplicationController < ActionController::Base

    def index
        @pets = Pet.all
        @pet = []
        @interested_user = []
        @interested_user = Interested.select do |interested| interested.user_id == current_user.id
            @interested_user.each do |int|
                @pet << int.pet_id 
            
            end

        end
 
        
    end
end
