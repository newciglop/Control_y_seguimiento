class RegisterBook < ApplicationRecord
  scope :by_month, lambda {|date| where('create_time >= ? AND create_time <=  ?', date.beginning_of_month, date.end_of_month)}
  belongs_to :offer, optional: true
  belongs_to :admin_control, optional: true
end
