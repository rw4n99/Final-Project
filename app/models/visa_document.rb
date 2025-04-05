class VisaDocument < ApplicationRecord
  belongs_to :user
  has_one_attached :visa_application_form  # Attach a file to the model

  # other fields...
end