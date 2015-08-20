class NextOfKin < ActiveRecord::Base
	acts_as_paranoid
  belongs_to :employee

  attr_accessor :full_address

  def full_address
    [first_name, last_name, address].join('/ ')
  end
end
