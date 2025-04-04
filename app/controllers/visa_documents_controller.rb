class VisaDocumentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @visa_document = current_user.visa_documents.build
  end

  def index
    @visa_documents = current_user.visa_documents
  end

  def create
    @visa_document = current_user.visa_documents.build(visa_document_params)
    
    if @visa_document.save
      if @visa_document.visa_application_form.attached?
        flash[:notice] = "Document uploaded successfully."
      else
        flash[:alert] = "Please upload the National Visa Application Form."
      end
      redirect_to visa_documents_path # Redirect to the documents index page, or back to form if you prefer
    else
      render :new
    end
  end

  private

  def update
    @visa_document = current_user.visa_documents.find(params[:id])
    if @visa_document.update(visa_document_params)
      redirect_to visa_documents_path
    else
      render :edit
    end
  end

  private

  def visa_document_params
    params.require(:visa_document).permit(
      :eligibility,
      :address,
      :visa_application_form # Include the file in the permitted params
    )
  end
end