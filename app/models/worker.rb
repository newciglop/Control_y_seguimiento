class Worker < ApplicationRecord
  belongs_to :profile
  belongs_to :type_identification

  validates :identification,presence: true,numericality: true
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
