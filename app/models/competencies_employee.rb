class CompetenciesEmployee < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :employee

  def self.employees_with_expiry_competency
    self.where('end_date <= ?', Date.today - 6.month).group(:employee_id).maximum(:end_date).map { |key, value| key }
  end
end
