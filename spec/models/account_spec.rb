require 'rails_helper'

describe Account, type: :model do
  describe 'validations' do
    it { should validate_presence_of :owner }
    it { should validate_presence_of :subdomain }
    it { should validate_uniqueness_of :subdomain }

    it { should allow_value('natedalo').for(:subdomain) }
    it { should allow_value('test').for(:subdomain) }

    it { should_not allow_value('www').for(:subdomain) }
    it { should_not allow_value('WWW').for(:subdomain) }
    it { should_not allow_value('.test').for(:subdomain) }
    it { should_not allow_value('test/').for(:subdomain) }
  end

  describe 'associations' do
    it { should belong_to :owner }
  end
end
