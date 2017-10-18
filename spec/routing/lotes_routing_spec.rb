require "rails_helper"

RSpec.describe LotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lotes").to route_to("lotes#index")
    end


    it "routes to #show" do
      expect(:get => "/lotes/1").to route_to("lotes#show", :id => "1")
    end


  end
end
