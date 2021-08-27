require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before do
    @transaction = assign(:transaction, Transaction.create!(
                                          amount: 2.5,
                                          wallet: nil,
                                          cryptocurrency: nil
                                        ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
