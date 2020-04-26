require 'rails_helper'

RSpec.describe '/libraries', type: :request do
  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LibrariesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe 'GET /index' do
    let!(:movie) { create :movie }
    let!(:season) { create :season }
    it 'renders the full catalogue' do
      get libraries_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body).length).to eq(Movie.all.count + Season.all.count)
    end
  end
end
