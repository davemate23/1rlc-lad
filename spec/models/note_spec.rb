require 'rails_helper'

describe Note do
  subject { build(:note) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
