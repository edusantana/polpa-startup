require 'rails_helper'

RSpec.describe "lotes/new", type: :view do
  before(:each) do
    assign(:lote, Lote.new())
  end

  it "renders new lote form" do
    render

    assert_select "form[action=?][method=?]", lotes_path, "post" do
    end
  end
end
