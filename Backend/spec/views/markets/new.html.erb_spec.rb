require 'rails_helper'

RSpec.describe "markets/new", type: :view do
  before do
    assign(:market, Market.new(
                      clp: 1
                    ))
  end

  it "renders new market form" do
    render

    assert_select "form[action=?][method=?]", markets_path, "post" do
      assert_select "input[name=?]", "market[clp]"
    end
  end
end
