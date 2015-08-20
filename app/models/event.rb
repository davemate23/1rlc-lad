class Event < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :employee

  scope :next_two_month, -> { where(start_date: Date.today..Date.today + 2.month) }
  scope :with_start_date, -> { where.not(start_date: nil) }
  scope :with_end_date, -> { where.not(end_date: nil) }
  scope :with_event_type, -> { where.not(event_type: nil) }
  scope :with_activated_employee, -> { includes(:employee).where({employees: { activated: true }}) }

  scope :away, -> { where(away: true) }
end
