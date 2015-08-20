require 'rails_helper'

describe Dependant do
  subject { build(:dependant) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
