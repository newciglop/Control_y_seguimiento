class AddNewColumnsDateObsOfferEvaluationOfferToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :date_obs_offer_evaluation_report, :datetime
    add_column :offers, :remaining_day_obs_offer_evaluation_report, :integer
    add_column :offers, :remaining_hour_obs_offer_evaluation_report, :integer
    add_column :offers, :status_obs_offer_evaluation_report, :string
  end
end
