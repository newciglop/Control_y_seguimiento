class Offer < ApplicationRecord
  belongs_to :worker , optional: true
  belongs_to :modality , optional: true
  belongs_to :city, optional: true
  belongs_to :company, optional: true


  def self.STATUS
    [["En proceso","En proceso"],["Descartado","Descartado"],["Adjudicado","Adjudicado"],["Entregado","Entregado"]].sort
  end

  def self.STATUS_YES_OR_NOT
    [["Si","Si"],[["No","No"]]]
  end

end
