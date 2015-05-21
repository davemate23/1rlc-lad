require 'rails_helper'

describe TradeCareer do
  subject { build(:trade_career) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
