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
