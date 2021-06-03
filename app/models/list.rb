class List < ApplicationRecord
  belongs_to :admin_control


  def completed?
    completed == true
  end
end
