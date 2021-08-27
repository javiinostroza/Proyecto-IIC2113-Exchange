require 'rails_helper'

RSpec.describe "balances/new", type: :view do
  before do
    assign(:balance, Balance.new(
                       amount: 1.5,
                       wallet: nil,
                       market: nil,
                       cryptocurrency: nil
                     ))
  end

  it "renders new balance form" do
    render

    assert_select "form[action=?][method=?]", balances_path, "post" do
      assert_select "input[name=?]", "balance[amount]"

      assert_select "input[name=?]", "balance[wallet_id]"

      assert_select "input[name=?]", "balance[market_id]"

      assert_select "input[name=?]", "balance[cryptocurrency_id]"
    end
  end
end
