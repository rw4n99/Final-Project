class VisaDocument < ApplicationRecord
  belongs_to :user
  has_one_attached :visa_application_form
  has_one_attached :photograph_id
  has_one_attached :passport
  has_one_attached :nombramiento
  has_one_attached :health_insurance
  has_one_attached :criminal_record
  has_one_attached :medical_certificate
  has_one_attached :visa_application_payment

end