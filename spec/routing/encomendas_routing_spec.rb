require "rails_helper"

RSpec.describe EncomendasController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "lotes/1/encomendas/new").to route_to("encomendas#new", :lote_id => "1")
    end


  end
end
