class ApplicationController < ActionController::Base

    def index
        if current_user

            @pet_objects = []

            @interested_user = Interested.where(:user_id => current_user.id)
         #  raise params.inspect
        #     @pets = Pet.all
        #     @pet_ids = []
        #     
       
        #     @interested_user = current_user.interested.all
        
            @interest_pets = @interested_user.map do |eachuser| eachuser.pet_id
            end
            @interest_pets.each do |eachpet|
                if Pet.find(eachpet)
                        @pet_objects << Pet.find(eachpet)
                end
            end
            #raise params.inspect
        end
    end
end


