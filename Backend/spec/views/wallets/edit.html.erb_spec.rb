require 'rails_helper'

RSpec.describe "wallets/edit", type: :view do
  before do
    @wallet = assign(:wallet, Wallet.create!(
                                clp: 1,
                                user: nil
                              ))
  end

  it "renders the edit wallet form" do
    render

    assert_select "form[action=?][method=?]", wallet_path(@wallet), "post" do
      assert_select "input[name=?]", "wallet[clp]"

      assert_select "input[name=?]", "wallet[user_id]"
    end
  end
end
