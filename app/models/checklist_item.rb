class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  validates :status , inclusion: { in: ['without_start','in_progress','complete']}
  validates_presence_of :status

  def self.STATUS_OPTIONS
    [
      ['Sin iniciar','without_start'],
      ['En Progreso','in_progress'],
      ['Completado','complete']
  ]
  end

  def readable_status
    case status
    when 'without_start'
      'Sin iniciar'
    when 'in_progress'
      'En Progreso'
    when 'complete'
      'Completado'
    end
  end

  def color_class
    case status
    when 'without_start'
      'secondary'
    when 'in_progress'
      'info'
    when 'complete'
      'success'
    end
  end

end
