class AddNewColumnsDateOfferEvaluationOfferToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :date_offer_evaluation_report, :datetime
    add_column :offers, :remaining_day_offer_evaluation_report, :integer
    add_column :offers, :remaining_hour_offer_evaluation_report, :integer
    add_column :offers, :status_offer_evaluation_report, :string
  end
end
