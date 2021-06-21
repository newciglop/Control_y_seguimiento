class Student < ApplicationRecord


  belongs_to :process
  belongs_to :type_identification
  belongs_to :city
  belongs_to :university
  belongs_to :title
=begin



  belongs_to :title



  validates :name, :last_name,:phone,:address,:score,:semester,presence:true
  validates :semester,:career,:comment,:age,:birthday, presence:true
  validates :link_data,:issued_in,:link_university ,presence:true
  validates :leader_first,:leader_second, presence: true
  validates :identification,presence: true,numericality: true
  validates :mail, presence: true , format: { with: /\A\S+@.+\.\S+\z/ ,message: "Direccion valida con @" }

=end
  has_rich_text :body_1
  has_rich_text :body_2


end
