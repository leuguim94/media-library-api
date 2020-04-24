require 'rails_helper'

RSpec.describe Episode, type: :model do

  describe 'create' do
    let!(:episode_1) { create :episode_1 }

    it 'sets the proper information' do
      expect(episode_1.title).to eq('Friends 1x01')
      expect(episode_1.plot).to eq('Friends Season 1 Episode 1')
      expect(episode_1.number).to eq 1
      expect(episode_1.season.title).to eq('Friends')
      expect(Episode.count).to eq 1
    end
  end
end
