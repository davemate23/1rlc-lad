require 'rails_helper'

describe Responsibility do
  subject { build(:responsibility) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
