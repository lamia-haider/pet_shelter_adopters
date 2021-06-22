class ApplicationController < ActionController::Base

    def index
        @pets = Pet.all
        @interested_all = Interested.all
    end
end
