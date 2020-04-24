require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'create' do
    let!(:user) { create :user }

    it 'sets the proper information' do
      expect(user.email).to eq('valen@domain.com')
      expect(User.count).to eq 1
    end
  end
end
