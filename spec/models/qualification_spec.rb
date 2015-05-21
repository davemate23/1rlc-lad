require 'rails_helper'

describe Qualification do
  subject { build(:qualification) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
