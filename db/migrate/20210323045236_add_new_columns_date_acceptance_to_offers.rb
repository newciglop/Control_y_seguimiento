class AddNewColumnsDateAcceptanceToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :date_acceptance_offers, :datetime
    add_column :offers, :remaining_day_acceptance_offers, :integer
    add_column :offers, :remaining_hour_acceptance_offers, :integer
    add_column :offers, :status_acceptance_offers, :string
  end
end
