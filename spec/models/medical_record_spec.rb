require 'rails_helper'

describe MedicalRecord do
  subject { build(:medical_record) }

  specify 'associations' do
    expect(subject).to belong_to(:employee)
  end
end
