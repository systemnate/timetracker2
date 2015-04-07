require 'rails_helper'

RSpec.describe TaskDetail do
  describe 'validations' do
    it { should validate_presence_of :body }
  end

  describe 'associations' do
    it { should belong_to :task }
    it { should belong_to :user }
  end
end