class HasSupport < ApplicationRecord
  belongs_to :worker, optional: true
  belongs_to :admin_control, optional: true
end
