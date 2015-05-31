require 'rails_helper'

describe Report do
  subject { build(:report) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
