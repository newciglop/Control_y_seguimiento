class Company < ApplicationRecord
  validates :name, presence: true
  validates :identification, presence: true , numericality: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :email, presence: true ,  format: { with: /\A\S+@.+\.\S+\z/ ,message: "Direccion valida con @" }
end
