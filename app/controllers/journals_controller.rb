class JournalsController < ApplicationController
    def index
        @journals = Journal.all
    end
        
    def new
        @journal = Journal.new()
    end
        
    def create
        @journal = Journal.new(journal_params)
        if @journal.save
           redirect_to root_url
       else
           render :new
       end
    end
    
    def destroy
        Journal.find(params[:id]).destroy
        redirect_to root_url
    end

    private

    def journal_params
        params.require(:journal).permit(:name, :link)
    end
end