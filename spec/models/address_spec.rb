require 'rails_helper'

describe Address do
  subject { build(:address) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
