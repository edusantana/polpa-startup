require 'rails_helper'

RSpec.describe "lotes/show", type: :view do
  before(:each) do
    @lote = assign(:lote, Lote.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
