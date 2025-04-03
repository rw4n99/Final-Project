class VisaApplication < ApplicationRecord
  belongs_to :user

  has_one_attached :documents  # Add this line for file uploads

  validates :documents_collected, inclusion: { in: [true, false] }
end