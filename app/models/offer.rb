class Offer < ApplicationRecord
  scope :by_month, lambda {|date| where('publication_date >= ? AND publication_date <=  ?', date.beginning_of_month, date.end_of_month)}
  belongs_to :worker
  belongs_to :modality
  belongs_to :city, optional: true
  belongs_to :company, optional: true
  belongs_to :user


  validates :code,:worker_id,:modality_id, :status, :publication_date, presence: true
  validates :date_submission_obs, :date_offer_evaluation_report,:date_deadline_submission_offers,
            :date_obs_offer_evaluation_report,:date_publication_observations_report,:date_acceptance_offers,presence: true
  validates :status_obs_offer_evaluation_report,:status_offer_evaluation_report,:status_obs_report,
            :status_acceptance_offers,:status_submission_offers,:status_obs , presence: true
  validates :presented_value,:budget_value, :company_id, :city_id, :official_page,:email_company,
            :email_alternative,:link_document,presence: true

  #solo date y status
  has_rich_text :object



  def self.STATUS
    [["En proceso","En proceso"],["Descartado","Descartado"],["Adjudicado","Adjudicado"],["Entregado","Entregado"]].sort
  end

  def self.STATUS_YES_OR_NOT
    [["Si","Si"],["No","No"]]
  end






end
