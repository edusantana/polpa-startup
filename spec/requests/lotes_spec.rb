require 'rails_helper'

RSpec.describe "Lotes", type: :request do
  describe "GET /lotes" do
    it "works! (now write some real specs)" do
      get lotes_path
      expect(response).to have_http_status(200)
    end
  end
end
