require 'rails_helper'

RSpec.describe "cryptocurrencies/new", type: :view do
  before do
    assign(:cryptocurrency, Cryptocurrency.new(
                              name: "MyString",
                              value: 1.5
                            ))
  end

  it "renders new cryptocurrency form" do
    render

    assert_select "form[action=?][method=?]", cryptocurrencies_path, "post" do
      assert_select "input[name=?]", "cryptocurrency[name]"

      assert_select "input[name=?]", "cryptocurrency[value]"
    end
  end
end
