class Report < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :employee
end
