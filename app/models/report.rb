class Report < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :employee

  def self.employees_with_expiry_report
    self.where('next_date <= ?', Date.today - 2.month).group(:employee_id).maximum(:next_date).map { |key, value| key }
  end
end
