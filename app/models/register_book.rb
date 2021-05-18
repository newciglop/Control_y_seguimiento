class RegisterBook < ApplicationRecord
  belongs_to :offer, optional: true
  belongs_to :admin_control, optional: true
end
