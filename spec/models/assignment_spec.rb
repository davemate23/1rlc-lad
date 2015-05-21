require 'rails_helper'

describe Assignment do
  subject { build(:assignment) }

  specify 'associations' do
    expect(subject).to belong_to(:role)
    expect(subject).to belong_to(:employee)
  end

  specify 'validations' do
    expect(subject).to validate_presence_of(:role_id)
    expect(subject).to validate_presence_of(:employee_id)
  end

  describe 'scopes' do
    specify 'active' do
      assignment1_id = create(:assignment, start_date: nil, end_date: Time.now + 4.days).id
      assignment2_id = create(:assignment, start_date: Time.now + 2.days, end_date: Time.now + 2.days).id
      assignment3_id = create(:assignment, start_date: Time.now - 2.days, end_date: nil).id
      assignment4_id = create(:assignment, start_date: nil, end_date: nil).id

      expect(Assignment.all.active.ids).to eq [assignment1_id, assignment3_id, assignment4_id]
    end
  end
end
