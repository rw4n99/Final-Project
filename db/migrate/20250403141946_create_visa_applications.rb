class CreateVisaApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :visa_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :eligibility
      t.boolean :consular_jurisdiction
      t.boolean :documents_collected
      t.boolean :application_submitted
      t.string :address
      t.json :document_dates

      t.timestamps
    end
  end
end
