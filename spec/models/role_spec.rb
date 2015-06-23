require 'rails_helper'

describe Role do
  subject { build(:role) }

  specify 'validations' do
    expect(subject).to validate_presence_of(:description)
    expect(subject).to validate_presence_of(:pid)
  end

  specify 'associations' do
    expect(subject).to have_many(:assignments)
    expect(subject).to have_many(:employees)
  end

  describe 'instance methods' do
    let!(:role1) { create(:role) }
    let!(:role2) { create(:role, role: role1) }
    let!(:role3) { create(:role, role: role2) }

    let!(:employee1) { create(:employee) }
    let!(:employee2) { create(:employee) }
    let!(:employee3) { create(:employee) }
    let!(:employee4) { create(:employee) }

    let!(:assignment1) { create(:assignment, employee: employee1, role: role1) }
    let!(:assignment2) { create(:assignment, employee: employee2, role: role2) }
    let!(:assignment3) { create(:assignment, employee: employee3, role: role3) }
    let!(:assignment4) { create(:assignment, employee: employee4, role: role3) }

    specify 'child_employees_ids' do
      expect(role1.child_employees_ids).to eq [employee1.id, employee2.id, employee3.id, employee4.id]
      expect(role2.child_employees_ids).to eq [employee2.id, employee3.id, employee4.id]
      expect(role3.child_employees_ids).to eq [employee3.id, employee4.id]
    end

    specify 'line_employees_ids' do
      expect(role1.line_employees_ids).to eq [employee1.id]
      expect(role2.line_employees_ids).to eq [employee2.id]
      expect(role3.line_employees_ids).to eq [employee3.id, employee4.id]
    end
  end
end
