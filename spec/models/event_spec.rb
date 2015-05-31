require 'rails_helper'

describe Event do
  subject { build(:event) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
