require 'rails_helper'

RSpec.describe "balances/index", type: :view do
  before do
    assign(:balances, [
             Balance.create!(
               amount: 2.5,
               wallet: nil,
               market: nil,
               cryptocurrency: nil
             ),
             Balance.create!(
               amount: 2.5,
               wallet: nil,
               market: nil,
               cryptocurrency: nil
             )
           ])
  end

  it "renders a list of balances" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
