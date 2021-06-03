class HasManager < ApplicationRecord
  belongs_to :worker
  belongs_to :admin_control
end
