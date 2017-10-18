require 'rails_helper'

RSpec.describe "encomendas/show", type: :view do
  before(:each) do
    @encomenda = assign(:encomenda, Encomenda.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
