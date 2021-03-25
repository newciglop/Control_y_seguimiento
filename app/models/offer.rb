class Offer < ApplicationRecord
  belongs_to :worker , optional: true
  belongs_to :modality , optional: true
  belongs_to :city, optional: true
  belongs_to :company, optional: true


  validates :date_deadline_submission_offers , presence: true
  validates :date_publication_observations_report ,presence: true
  validates :publication_date, presence: true

  has_rich_text :object


  def self.STATUS
    [["En proceso","En proceso"],["Descartado","Descartado"],["Adjudicado","Adjudicado"],["Entregado","Entregado"]].sort
  end

  def self.STATUS_YES_OR_NOT
    [["Si","Si"],["No","No"]]
  end

end
