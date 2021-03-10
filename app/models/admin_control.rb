class AdminControl < ApplicationRecord
  belongs_to :concept, optional: true
  belongs_to :theme, optional: true
  belongs_to :type, optional: true
  belongs_to :item, optional: true
  belongs_to :company, optional: true
  belongs_to :city , optional: true
  belongs_to :responsible_function , optional: true
  belongs_to :user, optional: true

  has_rich_text :description_advance

  def self.TYPE_IPM
    1
  end
  def self.TYPE_PT
    2
  end

  def self.STATE_STOPPED
    1
  end
  def self.STATE_FINISH
    2
  end
  def self.IN_PROCESS
    3
  end



  def self.COMBO_TRACKING_TYPES
    [["IPM -Inmediato  Prioritario Mesa Tecnica",1],["PT - Progresivo Tranversal",2]]
  end

  def self.COMBO_STATES
    [["Detenido",1],["Terminado",2],["En Proceso",3]].sort
  end

end
