class Worker < ApplicationRecord
  belongs_to :profile
  belongs_to :type_identification

  validates :first_name,:last_name,:phone,:phone_2, presence: true
  validates :function,:profile_id ,:profile_2,:profile_3,:profile_4,presence: true
  validates :identification, presence: true,numericality: true
  validates :type_identification_id, presence: true
  validates :email, presence: true ,  format: { with: /\A\S+@.+\.\S+\z/ ,message: "Direccion valida con @" }

  has_rich_text :function

  def full_name
    self.first_name + " " + self .last_name
  end

  def self.CHARACTERISTIC_TWO
    0
  end
  def self.CHARACTERISTIC_THREE
    1
  end
  def self.CHARACTERISTIC_FOUR
    2
  end
end
