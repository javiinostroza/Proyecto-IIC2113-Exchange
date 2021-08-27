require 'rails_helper'

RSpec.describe "balances/show", type: :view do
  before do
    @balance = assign(:balance, Balance.create!(
                                  amount: 2.5,
                                  wallet: nil,
                                  market: nil,
                                  cryptocurrency: nil
                                ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
