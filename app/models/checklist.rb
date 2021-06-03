class Checklist < ApplicationRecord
  belongs_to :admin_control
  has_many :checklist_items , dependent: :destroy


  def new_item
   checklist_items.build
  end

  def percent_complete
    #return 0 #if total_items == 0
    #((checklist_items.select(&:complete?).count.to_f / total_items)*100).round
  end
  def percent_in_progress
    50
  end

  def total_items
    @total_items ||= checklist_items.count
  end

end
