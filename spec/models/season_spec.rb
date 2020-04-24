require 'rails_helper'

RSpec.describe Season, type: :model do

  describe 'create' do
    let!(:season) { create :season }

    it 'sets the proper information' do
      expect(season.title).to eq('Friends')
      expect(season.plot).to eq('Ross Geller, Rachel Green, Monica Geller, Joey Tribbiani, Chandler Bing, and Phoebe Buffay are six 20 something year olds living in New York City. Over the course of 10 years, these friends go through family, love, drama, friendship, and comedy.')
      expect(season.number).to eq 1
      expect(Season.count).to eq 1
    end
  end
end
