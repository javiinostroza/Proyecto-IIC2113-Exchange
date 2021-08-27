require 'rails_helper'

RSpec.describe "cryptocurrencies/index", type: :view do
  before do
    assign(:cryptocurrencies, [
             Cryptocurrency.create!(
               name: "Name",
               value: 2.5
             ),
             Cryptocurrency.create!(
               name: "Name",
               value: 2.5
             )
           ])
  end

  it "renders a list of cryptocurrencies" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
