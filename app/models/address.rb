class Address < ActiveRecord::Base
	belongs_to :employee
  acts_as_paranoid

  attr_accessor :full_name

  def full_name
    [street_address, street_address_2, town, county, post_code, country].join('/ ')
  end
end
