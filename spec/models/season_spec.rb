require 'rails_helper'

RSpec.describe Season, type: :model do

  describe 'create' do
    let!(:season) { create :season }

    it 'sets the proper information' do
      expect(season.title).to eq('Breaking Bad')
      expect(season.plot).to eq("A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.")
      expect(season.number).to eq 1
    end
  end
end
