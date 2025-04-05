class VisaDocument < ApplicationRecord
  belongs_to :user
  has_one_attached :visa_application_form  # Attach a file to the model
  has_one_attached :photograph_id

  # other fields...
end