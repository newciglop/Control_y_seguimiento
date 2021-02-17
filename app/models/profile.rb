class Profile < ApplicationRecord


  def self.PROFILE_TYPE
    [["Lider",1],["Ingeniero Encargado",2],["Ingeniero acompañante",3],
     ["Responsable",4],["Apoyo",5],["Rol Responsable",6],["Comodin",7],
     ["Practicante",8],["Empleado",9],["Ingeniero",10]]
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
  def self.RESPONSIBLE_ROL
    6
  end
  def self.WILDCARD
    7
  end
  def self.INTERN
    8
  end
  def self.EMPLOYEE
    9
  end
  def self.ENGINEER
    10
  end


end
