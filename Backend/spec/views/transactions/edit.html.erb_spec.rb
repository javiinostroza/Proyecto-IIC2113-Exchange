require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before do
    @transaction = assign(:transaction, Transaction.create!(
                                          amount: 1.5,
                                          wallet: nil,
                                          cryptocurrency: nil
                                        ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do
      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[wallet_id]"

      assert_select "input[name=?]", "transaction[cryptocurrency_id]"
    end
  end
end
