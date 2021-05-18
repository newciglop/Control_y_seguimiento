class Checklist < ApplicationRecord
  belongs_to :admin_control
  has_many :checklist_items , dependent: :destroy


  def new_item
   checklist_items.build
  end


end
