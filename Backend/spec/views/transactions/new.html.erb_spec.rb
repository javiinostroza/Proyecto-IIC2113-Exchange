require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before do
    assign(:transaction, Transaction.new(
                           amount: 1.5,
                           wallet: nil,
                           cryptocurrency: nil
                         ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[wallet_id]"

      assert_select "input[name=?]", "transaction[cryptocurrency_id]"
    end
  end
end
