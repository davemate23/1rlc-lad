class Qualification < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :employee
  has_and_belongs_to_many :employees
end
