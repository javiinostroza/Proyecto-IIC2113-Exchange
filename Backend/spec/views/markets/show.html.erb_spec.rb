require 'rails_helper'

RSpec.describe "markets/show", type: :view do
  before do
    @market = assign(:market, Market.create!(
                                clp: 2
                              ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
