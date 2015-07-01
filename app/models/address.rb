class Address < ActiveRecord::Base
	belongs_to :employee
  acts_as_paranoid
end
