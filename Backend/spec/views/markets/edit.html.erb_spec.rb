require 'rails_helper'

RSpec.describe "markets/edit", type: :view do
  before do
    @market = assign(:market, Market.create!(
                                clp: 1
                              ))
  end

  it "renders the edit market form" do
    render

    assert_select "form[action=?][method=?]", market_path(@market), "post" do
      assert_select "input[name=?]", "market[clp]"
    end
  end
end
