class Student < ApplicationRecord
  validates :name, :last_name,:phone,:mail,:address,:score,presence:true
  validates :semester,:career,:comment,:mail,:mail_2,:age,:birthday, presence:true
  validates :link_data,:identification,:issued_in,:link_university ,presence:true
end
