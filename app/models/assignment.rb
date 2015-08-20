class Assignment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :employee
  belongs_to :role

  validates :role_id,      presence: true
  validates :employee_id,  presence: true

  scope :active, -> { where("(? BETWEEN start_date AND end_date) OR
                             (start_date IS NULL AND end_date IS NULL) OR
                             (start_date <= ? AND end_date IS NULL) OR
                             (start_date IS NULL AND end_date > ?)", Date.today, Date.today, Date.today) }

end
