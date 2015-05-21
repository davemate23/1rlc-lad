require 'rails_helper'

describe Competency do
  subject { build(:competency) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
