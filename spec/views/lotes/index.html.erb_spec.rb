require 'rails_helper'

RSpec.describe "lotes/index", type: :view do
  before(:each) do
    assign(:lotes, [
      Lote.create!(),
      Lote.create!()
    ])
  end

  it "renders a list of lotes" do
    render
  end
end
