class Profile < ApplicationRecord

  def self.PROFILE_TYPE
    [["Lider",1],["Ingeniero encargado",2],["Ingeniero acompañante",3],["Personal",4]]
  end

  def self.PROFILE_LEADER
    1
  end
  def self.PROFILE_ENGINEER_IN_CHARGE
    2
  end
  def self.PROFILE_ENGINEER_ATTENDANT
    3
  end
  def self.PERSONAL
    4
  end


end
