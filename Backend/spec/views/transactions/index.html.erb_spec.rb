require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before do
    assign(:transactions, [
             Transaction.create!(
               amount: 2.5,
               wallet: nil,
               cryptocurrency: nil
             ),
             Transaction.create!(
               amount: 2.5,
               wallet: nil,
               cryptocurrency: nil
             )
           ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
