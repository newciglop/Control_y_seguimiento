class AddNewColumnsDateDeadlineToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :date_deadline_submission_offers, :datetime
    add_column :offers, :remaining_day_submission_offers, :integer
    add_column :offers, :remaining_hour_submission_offers, :integer
    add_column :offers, :status_submission_offers, :string
  end
end
