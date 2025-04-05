class JournalsController < ApplicationController
    def index
      if user_signed_in?
        @visa_document = VisaDocument.find_by(user_id: current_user.id)
        puts "user in"
      else
        @visa_document = nil
      end
    end
  
    def new
    end
  
    private
  end