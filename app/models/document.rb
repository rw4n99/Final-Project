class Document < ApplicationRecord
  belongs_to :visa_application

  validates :document_type, presence: true
  validates :file, presence: true
end