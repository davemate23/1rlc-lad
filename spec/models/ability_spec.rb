require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  let(:ability){ Ability.new(user) }

  describe 'nil' do
    let(:user) { nil }

    it { expect(ability).not_to be_able_to(:manage, :all) }
  end

  describe 'admin' do
    let(:user) { build(:employee, :admin) }

    it { expect(ability).to be_able_to(:manage, :all) }
  end
end
