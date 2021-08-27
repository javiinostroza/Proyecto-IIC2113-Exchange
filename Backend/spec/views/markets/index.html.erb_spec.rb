require 'rails_helper'

RSpec.describe "markets/index", type: :view do
  before do
    assign(:markets, [
             Market.create!(
               clp: 2
             ),
             Market.create!(
               clp: 2
             )
           ])
  end

  it "renders a list of markets" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
