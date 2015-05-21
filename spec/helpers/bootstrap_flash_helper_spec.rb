require 'rails_helper'

describe BootstrapFlashHelper do
  describe 'bootstrap_flash' do
    let(:message) { 'Some message' }

    it ':notice' do
      helper.flash[:notice] = message
      result = helper.bootstrap_flash
      expect(result).to have_selector('.alert-success')
      expect(result).to have_content(message)
    end

    it ':alert' do
      helper.flash[:alert] = message
      result = helper.bootstrap_flash
      expect(result).to have_selector('.alert-danger')
      expect(result).to have_content(message)
    end

    it ':error' do
      helper.flash[:error] = message
      result = helper.bootstrap_flash
      expect(result).to have_selector('.alert-danger')
      expect(result).to have_content(message)
    end
  end
end
