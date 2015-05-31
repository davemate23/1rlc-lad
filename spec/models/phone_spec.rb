require 'rails_helper'

describe Phone do
  subject { build(:phone) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
