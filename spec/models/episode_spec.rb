# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  plot       :string
#  number     :integer
#  season_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'create' do
    let!(:episode_1) { create :episode_1 }

    it 'sets the proper information' do
      expect(episode_1.title).to eq('Breaking Bad 1x01')
      expect(episode_1.plot).to eq('Breaking Bad Season 1 Episode 1')
      expect(episode_1.number).to eq 1
      expect(episode_1.season.title).to eq('Breaking Bad')
      expect(Episode.count).to eq 1
    end
  end
end
