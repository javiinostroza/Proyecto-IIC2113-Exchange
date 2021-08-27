require 'rails_helper'

RSpec.describe "balances/edit", type: :view do
  before do
    @balance = assign(:balance, Balance.create!(
                                  amount: 1.5,
                                  wallet: nil,
                                  market: nil,
                                  cryptocurrency: nil
                                ))
  end

  it "renders the edit balance form" do
    render

    assert_select "form[action=?][method=?]", balance_path(@balance), "post" do
      assert_select "input[name=?]", "balance[amount]"

      assert_select "input[name=?]", "balance[wallet_id]"

      assert_select "input[name=?]", "balance[market_id]"

      assert_select "input[name=?]", "balance[cryptocurrency_id]"
    end
  end
end
