class Employee < ActiveRecord::Base
	has_many :competencies
	has_one :spouse
	has_many :next_of_kins
	has_many :phones
	has_many :qualifications
	has_many :addresses
end
