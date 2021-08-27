require 'rails_helper'

RSpec.describe "wallets/index", type: :view do
  before do
    assign(:wallets, [
             Wallet.create!(
               clp: 2,
               user: nil
             ),
             Wallet.create!(
               clp: 2,
               user: nil
             )
           ])
  end

  it "renders a list of wallets" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
