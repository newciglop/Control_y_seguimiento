class University < ApplicationRecord
  belongs_to :city
  validates :name,:address,:phone,:city_id,:agreement, presence: true
  validates :contact,:contact_phone, presence: true


  def self.AGREEMENT
    [["Si","Si"],["No","No"],["En proceso","En proceso"]].map{|a| [a[1],a[0]]}
  end
end
