require 'rails_helper'

RSpec.describe "wallets/new", type: :view do
  before do
    assign(:wallet, Wallet.new(
                      clp: 1,
                      user: nil
                    ))
  end

  it "renders new wallet form" do
    render

    assert_select "form[action=?][method=?]", wallets_path, "post" do
      assert_select "input[name=?]", "wallet[clp]"

      assert_select "input[name=?]", "wallet[user_id]"
    end
  end
end
