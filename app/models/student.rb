class Student < ApplicationRecord

  belongs_to :type_identification
  belongs_to :states_student
  belongs_to :city
  belongs_to :title
  belongs_to :university

  validates :name, :last_name,:phone,:address,:score,:semester,presence:true
  validates :semester,:career,:comment,:age,:birthday, presence:true
  validates :link_data,:issued_in,:link_university ,presence:true
  validates :leader_first,:leader_second, :states_student_id ,:body_1,:body_2, presence: true
  validates :identification,presence: true,numericality: true
  validates :mail, presence: true , format: { with: /\A\S+@.+\.\S+\z/ ,message: "Direccion valida con @" }


  has_rich_text :body_1
  has_rich_text :body_2


end
