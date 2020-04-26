# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  movie_id    :integer
#  season_id   :integer
#  user_id     :integer          not null
#  price       :float            not null
#  quality     :integer          not null
#  expire_date :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'create' do
    let!(:purchase_movie) { create :purchase_movie }

    it 'sets the proper information' do
      expect(purchase_movie.price).to eq(5284.91)
      expect(purchase_movie.quality).to eq('SD')
      expect(purchase_movie.movie.title).to eq('Inception')
      expect(purchase_movie.user.email).to eq('valen@domain.com')
      expect(Purchase.count).to eq 1
    end
  end
end
