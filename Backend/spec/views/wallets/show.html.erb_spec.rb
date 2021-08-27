require 'rails_helper'

RSpec.describe "wallets/show", type: :view do
  before do
    @wallet = assign(:wallet, Wallet.create!(
                                clp: 2,
                                user: nil
                              ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
