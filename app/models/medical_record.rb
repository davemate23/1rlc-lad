class MedicalRecord < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :employee

  def self.employees_with_expiry_medical_record
    self.where('mmr_next <= ?', Date.today - 2.month).group(:employee_id).maximum(:mmr_next).map { |key, value| key }
  end
end
