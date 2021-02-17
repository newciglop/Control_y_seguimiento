class AdminControl < ApplicationRecord
  belongs_to :concept
  belongs_to :theme
  belongs_to :type
  belongs_to :item
  belongs_to :company
  belongs_to :city
  belongs_to :responsible_function

  def self.COMBO_TRACKING_TYPES
    [["IPM",1],["PT",2]]
  end

  def self.COMBO_STATES
    [["D",1],["T",2],["P",3]]
  end

end
