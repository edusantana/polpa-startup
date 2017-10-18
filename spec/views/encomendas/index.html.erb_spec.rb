require 'rails_helper'

RSpec.describe "encomendas/index", type: :view do
  before(:each) do
    assign(:encomendas, [
      Encomenda.create!(),
      Encomenda.create!()
    ])
  end

  it "renders a list of encomendas" do
    render
  end
end
