class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  validates :status , inclusion: { in: ['sin-iniciar','en-progreso','completado']}
  validates_presence_of :status

  def self.STATUS_OPTIONS
    [
      ['Sin iniciar','sin-iniciar'],
      ['En Progreso','en-progreso'],
      ['Completado','completado']
  ]
  end

  def readable_status
    case status
    when 'sin-iniciar'
      'Sin iniciar'
    when 'en-progreso'
      'En Progreso'
    when 'completado'
      'Completado'
    end
  end

  def color_class
    case status
    when 'sin-iniciar'
      'secondary'
    when 'en-progreso'
      'info'
    when 'completado'
      'success'
    end
  end

end
