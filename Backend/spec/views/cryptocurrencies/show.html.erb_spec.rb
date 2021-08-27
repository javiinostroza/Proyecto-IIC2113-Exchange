require 'rails_helper'

RSpec.describe "cryptocurrencies/show", type: :view do
  before do
    @cryptocurrency = assign(:cryptocurrency, Cryptocurrency.create!(
                                                name: "Name",
                                                value: 2.5
                                              ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
