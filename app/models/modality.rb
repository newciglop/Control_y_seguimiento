class Modality < ApplicationRecord
  validates :name,:description,presence: true

end
