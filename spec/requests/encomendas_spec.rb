require 'rails_helper'

RSpec.describe "Encomendas", type: :request do
  describe "GET /encomendas" do
    it "works! (now write some real specs)" do
      get encomendas_path
      expect(response).to have_http_status(200)
    end
  end
end
