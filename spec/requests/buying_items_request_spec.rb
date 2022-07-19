require 'rails_helper'

RSpec.describe "BuyingItems", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/buying_items/index"
      expect(response).to have_http_status(:success)
    end
  end

end
