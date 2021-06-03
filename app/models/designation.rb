class Designation < ApplicationRecord
  belongs_to :area

  has_many :has_engineers
  has_many :engineers, through: :has_engineers
  serialize :engineers_elements
  attr_accessor :engineer_elements

  def save_engineers
    if engineer_elements.present?
    engineer_elements.each do | engineer_id|
      HasEngineer.find_or_create_by(designation: self, engineer_id: engineer_id)
    end
    end

  end

  def destroy_engineers(des_id,id)
    HasEngineer.where(designation_id: des_id).where(engineer_id:id).delete!
  end
end