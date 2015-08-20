require 'rails_helper'

describe PromotionDate do
  subject { build(:promotion_date) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
