class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :code
      t.references :worker, null: false, foreign_key: true
      t.references :modality, null: false, foreign_key: true
      t.string :status
      t.datetime :publication_date
      t.datetime :date_submission_obs
      t.integer :remaining_hour_obs
      t.integer :remaining_days_obs
      t.string :status_obs
      t.references :city, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.decimal :presented_value
      t.decimal :budget_value
      t.string :official_page
      t.string :email_company
      t.string :email_alternative
      t.string :link_document

      t.timestamps
    end
  end
end
