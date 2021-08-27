require 'rails_helper'

RSpec.describe "cryptocurrencies/edit", type: :view do
  before do
    @cryptocurrency = assign(:cryptocurrency, Cryptocurrency.create!(
                                                name: "MyString",
                                                value: 1.5
                                              ))
  end

  it "renders the edit cryptocurrency form" do
    render

    assert_select "form[action=?][method=?]", cryptocurrency_path(@cryptocurrency), "post" do
      assert_select "input[name=?]", "cryptocurrency[name]"

      assert_select "input[name=?]", "cryptocurrency[value]"
    end
  end
end
