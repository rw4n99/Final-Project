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

  def edit
    @visa_document = VisaDocument.find_by(id: params[:id])

    if @visa_document.nil?
      redirect_to visa_documents_path, alert: "Visa document not found."
    end
  end

  def update
    @visa_document = VisaDocument.find(params[:id])

    if @visa_document.update(visa_document_params)
      redirect_to visa_documents_path, notice: "Document updated successfully."
    else
      render :edit
    end
  end

  private
  def visa_document_params
    params.require(:visa_document).permit(
      :eligibility,
      :address,
      :visa_application_form,
      :photograph_id,
      :passport,
      :nombramiento,
      :health_insurance,
      :criminal_record,
      :medical_certificate,
      :visa_application_payment,
    )
  end

  def remove_attachment
    document = VisaDocument.find(params[:id])
  
    case params[:attachment]
    when "visa_application_form"
      document.visa_application_form.purge
    when "photograph_id"
      document.photograph_id.purge
    end
  
    redirect_to visa_documents_path, notice: "Attachment removed"
  end
end