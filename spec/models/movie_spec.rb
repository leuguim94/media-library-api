# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  plot       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'create' do
    let!(:movie) { create :movie }

    it 'sets the proper information' do
      expect(movie.title).to eq('Inception')
      expect(movie.plot).to eq('Dominic Cobb is an skilled thief, stealing data from his target through their dreams. Cobb is also a fugitive who misses his children. Someone approaches Cobb and wants to hire him but instead of getting information out, the man wants Cobb to implant something, a process called Inception. When the man offers to help Cobb go back to his children, Cobb agrees.')
      expect(Movie.count).to eq 1
    end
  end
end
