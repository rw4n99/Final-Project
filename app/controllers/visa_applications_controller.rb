class VisaApplicationsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_visa_document, only: [:destroy]

def set_visa_document
  @visa_document = current_user.visa_documents.find(params[:id])
end

  def new
    @visa_application = current_user.visa_applications.build
  end

  def create
    @visa_application = current_user.visa_applications.build(visa_application_params)
    if @visa_application.save
      redirect_to @visa_application
    else
      render :new
    end
  end

  def update
    @visa_application = current_user.visa_applications.find(params[:id])
    if @visa_application.update(visa_application_params)
      redirect_to @visa_application
    else
      render :edit
    end
  end

  def show
    @visa_application = current_user.visa_applications.find(params[:id])
  end

  private

  def visa_application_params
    params.require(:visa_application).permit(:documents_collected, :documents)
  end
end