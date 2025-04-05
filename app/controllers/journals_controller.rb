class JournalsController < ApplicationController
    def index
        
        @visa_document = VisaDocument.find_by(user_id: current_user.id)
        
    end
        
    def new
    end

    private

end
