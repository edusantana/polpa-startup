require 'rails_helper'

RSpec.describe "encomendas/edit", type: :view do
  before(:each) do
    @encomenda = assign(:encomenda, Encomenda.create!())
  end

  it "renders the edit encomenda form" do
    render

    assert_select "form[action=?][method=?]", encomenda_path(@encomenda), "post" do
    end
  end
end
