require 'rails_helper'

RSpec.describe "lotes/edit", type: :view do
  before(:each) do
    @lote = assign(:lote, Lote.create!())
  end

  it "renders the edit lote form" do
    render

    assert_select "form[action=?][method=?]", lote_path(@lote), "post" do
    end
  end
end
