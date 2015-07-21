require 'rails_helper'

RSpec.describe Project do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :client }
  end

  describe 'associations' do
    it { should belong_to :client }
    it { should belong_to :user }
  end
end
