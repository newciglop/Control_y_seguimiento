class Profile < ApplicationRecord
  validates :name, presence: true
  validates :profile_type, presence: true

  def self.PROFILE_TYPE
    [["Lider",1],["Ingeniero Encargado",2],["Ingeniero acompañante",3],
     ["Responsable",4],["Apoyo",5],["Comodin",6],
     ["Practicante",7],["Empleado",8],["Ingeniero",9]]
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
  def self.RESPONSIBLE
    4
  end
  def self.SUPPORT
    5
  end
  def self.WILDCARD
    6
  end
  def self.INTERN
    7
  end
  def self.EMPLOYEE
    8
  end
  def self.ENGINEER
    9
  end


end
