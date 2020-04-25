require 'rails_helper'

RSpec.describe "/episodes", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Episode. As you add validations to Episode, be sure to
  # adjust the attributes here as well.
  let(:season) {create :season}
  let(:valid_attributes) {
    {title: "Breaking Bad 1x06", number: 6, season_id: season.id}
  }

  let(:invalid_attributes) {
    {title: nil}
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # EpisodesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Episode.create! valid_attributes
      get episodes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      episode = Episode.create! valid_attributes
      get episode_url(episode), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Episode" do
        expect {
          post episodes_url,
               params: { episode: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Episode, :count).by(1)
      end

      it "renders a JSON response with the new episode" do
        post episodes_url,
             params: { episode: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Episode" do
        expect {
          post episodes_url,
               params: { episode: invalid_attributes }, as: :json
        }.to change(Episode, :count).by(0)
      end

      it "renders a JSON response with errors for the new episode" do
        post episodes_url,
             params: { episode: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: 'Breaking Bad 1x05', number: 5 }
      }

      it "updates the requested episode" do
        episode = Episode.create! valid_attributes
        patch episode_url(episode),
              params: { episode: new_attributes }, headers: valid_headers, as: :json
        episode.reload
        expect(episode.title).to eq('Breaking Bad 1x05')
      end

      it "renders a JSON response with the episode" do
        episode = Episode.create! valid_attributes
        patch episode_url(episode),
              params: { episode: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the episode" do
        episode = Episode.create! valid_attributes
        patch episode_url(episode),
              params: { episode: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested episode" do
      episode = Episode.create! valid_attributes
      expect {
        delete episode_url(episode), headers: valid_headers, as: :json
      }.to change(Episode, :count).by(-1)
    end
  end
end
