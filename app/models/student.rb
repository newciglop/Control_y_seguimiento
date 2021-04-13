class Student < ApplicationRecord

  belongs_to :type_identification
  belongs_to :states_student
  belongs_to :city

  validates :name, :last_name,:phone,:mail,:address,:score,presence:true
  validates :semester,:career,:comment,:mail,:mail_2,:age,:birthday, presence:true
  validates :link_data,:identification,:issued_in,:link_university ,presence:true
end
