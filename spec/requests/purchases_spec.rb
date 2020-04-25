require 'rails_helper'

RSpec.describe "/purchases", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Purchase. As you add validations to Purchase, be sure to
  # adjust the attributes here as well.
  let(:user) {create :user}
  let(:movie) {create :movie}
  let(:valid_attributes) {
    {price: 9.99, quality: 0, user_id: user.id, movie_id: movie.id}
  }

  let(:invalid_attributes) {
    {price: nil, quality: nil}
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PurchasesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Purchase.create! valid_attributes
      get purchases_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      purchase = Purchase.create! valid_attributes
      get purchase_url(purchase), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Purchase" do
        expect {
          post purchases_url,
               params: { purchase: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Purchase, :count).by(1)
      end

      it "renders a JSON response with the new purchase" do
        post purchases_url,
             params: { purchase: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Purchase" do
        expect {
          post purchases_url,
               params: { purchase: invalid_attributes }, as: :json
        }.to change(Purchase, :count).by(0)
      end

      it "renders a JSON response with errors for the new purchase" do
        post purchases_url,
             params: { purchase: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {price: 5.99, quality: 1}
      }

      it "updates the requested purchase" do
        purchase = Purchase.create! valid_attributes
        patch purchase_url(purchase),
              params: { purchase: new_attributes }, headers: valid_headers, as: :json
        purchase.reload
        expect(purchase.price).to eq(5.99)
        expect(purchase.quality).to eq('HD')
      end

      it "renders a JSON response with the purchase" do
        purchase = Purchase.create! valid_attributes
        patch purchase_url(purchase),
              params: { purchase: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the purchase" do
        purchase = Purchase.create! valid_attributes
        patch purchase_url(purchase),
              params: { purchase: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested purchase" do
      purchase = Purchase.create! valid_attributes
      expect {
        delete purchase_url(purchase), headers: valid_headers, as: :json
      }.to change(Purchase, :count).by(-1)
    end
  end
end
