require 'rails_helper'

describe NextOfKin do
  subject { build(:next_of_kin) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
