require 'rails_helper'

RSpec.describe "/seasons", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Season. As you add validations to Season, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Breaking Bad", number: 1}
  }

  let(:invalid_attributes) {
    {title: nil, number: 'a'}
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # SeasonsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Season.create! valid_attributes
      get seasons_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      season = Season.create! valid_attributes
      get season_url(season), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Season" do
        expect {
          post seasons_url,
               params: { season: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Season, :count).by(1)
      end

      it "renders a JSON response with the new season" do
        post seasons_url,
             params: { season: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Season" do
        expect {
          post seasons_url,
               params: { season: invalid_attributes }, as: :json
        }.to change(Season, :count).by(0)
      end

      it "renders a JSON response with errors for the new season" do
        post seasons_url,
             params: { season: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {title: "Vikings", number: 2}
      }

      it "updates the requested season" do
        season = Season.create! valid_attributes
        patch season_url(season),
              params: { season: new_attributes }, headers: valid_headers, as: :json
        season.reload
        expect(season.title).to eq("Vikings")
        expect(season.number).to eq(2)
      end

      it "renders a JSON response with the season" do
        season = Season.create! valid_attributes
        patch season_url(season),
              params: { season: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the season" do
        season = Season.create! valid_attributes
        patch season_url(season),
              params: { season: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested season" do
      season = Season.create! valid_attributes
      expect {
        delete season_url(season), headers: valid_headers, as: :json
      }.to change(Season, :count).by(-1)
    end
  end
end
