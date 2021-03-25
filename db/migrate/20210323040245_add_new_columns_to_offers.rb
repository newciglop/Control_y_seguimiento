class AddNewColumnsToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :date_publication_observations_report, :datetime
    add_column :offers, :remaining_day_obs_report, :integer
    add_column :offers, :remaining_hour_obs_report, :integer
    add_column :offers, :status_obs_report, :string
  end
end
