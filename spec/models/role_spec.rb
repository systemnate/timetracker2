require 'rails_helper'

RSpec.describe Role do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
end
