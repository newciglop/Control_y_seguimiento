class AdminControl < ApplicationRecord
  scope :by_month, lambda {|date| where('start_date >= ? AND start_date <=  ?', date.beginning_of_month, date.end_of_month)}
  belongs_to :concept
  belongs_to :theme
  belongs_to :type
  belongs_to :item
  belongs_to :company
  belongs_to :city
  belongs_to :responsible_function
  belongs_to :user, optional: true

  has_many :checklists
  has_many :lists

  has_many :has_managers
  has_many  :workers, through: :has_managers
  serialize :has_managers
  attr_accessor :manager_elements


  has_many :has_supports
  has_many :workers, through: :has_supports
  serialize :has_supports
  attr_accessor :support_elements

  def save_supports

    if support_elements.present?
    support_elements.each do | support_id |
      support = HasSupport.find_or_create_by(admin_control_id: self.id, worker_id: support_id)
    end
    end
  end

  def save_managers
    if manager_elements.present?
      manager_elements.each do | manager_id|
        HasManager.find_or_create_by(admin_control_id: self.id, worker_id: manager_id)
      end
    end
  end

  after_create do
    RegisterBook.where(admin_control_id: self.id).update(code_sa: self.sa)
  end


  validates :company_id,:type_id,:theme_id,presence: true
  validates :concept_id, :city_id,:item_id,:responsible_function_id , presence: true
  validates :start_date,:final_date, presence: true
  validates :tracking_type,presence: true
  validates :state, presence: true


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
