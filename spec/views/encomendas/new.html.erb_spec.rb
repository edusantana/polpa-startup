require 'rails_helper'

RSpec.describe "encomendas/new", type: :view do
  before(:each) do
    assign(:encomenda, Encomenda.new())
  end

  it "renders new encomenda form" do
    render

    assert_select "form[action=?][method=?]", encomendas_path, "post" do
    end
  end
end
