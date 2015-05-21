RSpec.configure do |config|
  config.before :each, type: :controller do
    set_abilty
  end

  config.before :each, type: :helper do
    set_abilty
  end

  def set_abilty
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(@controller).to receive(:current_ability).and_return(@ability)
  end
end
