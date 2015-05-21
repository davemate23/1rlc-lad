require 'rails_helper'

describe Spouse do
  subject { build(:spouse) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
