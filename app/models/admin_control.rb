class AdminControl < ApplicationRecord
  belongs_to :concept
  belongs_to :theme
  belongs_to :type
  belongs_to :item
  belongs_to :company
  belongs_to :city
  belongs_to :responsible_function
  belongs_to :user, optional: true

  has_many :checklists

  validates :company_id,:type_id,:theme_id,presence: true
  validates :concept_id, :city_id,:item_id,:responsible_function_id , presence: true


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
