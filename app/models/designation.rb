class Designation < ApplicationRecord
  belongs_to :area

  has_many :has_engineers
  has_many :engineers, through: :has_engineers
  serialize :engineers_elements
  attr_accessor :engineer_elements

  def save_engineers
    engineer_elements.each do | engineer_id|
      HasEngineer.find_or_create_by(designation: self, engineer_id: engineer_id)
    end
  end
end