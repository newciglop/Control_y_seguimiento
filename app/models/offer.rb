class Offer < ApplicationRecord

  belongs_to :worker
  belongs_to :modality
  belongs_to :city, optional: true
  belongs_to :company, optional: true

  validates :code,:worker_id ,:modality_id, :status, :publication_date, presence: true
  validates :date_submission_obs, :status_obs , presence: true
  #solo date y status
  has_rich_text :object


  def self.STATUS
    [["En proceso","En proceso"],["Descartado","Descartado"],["Adjudicado","Adjudicado"],["Entregado","Entregado"]].sort
  end

  def self.STATUS_YES_OR_NOT
    [["Si","Si"],["No","No"]]
  end

end
