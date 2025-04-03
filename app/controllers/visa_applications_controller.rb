class VisaApplicationsController < ApplicationController
  before_action :authenticate_user!

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