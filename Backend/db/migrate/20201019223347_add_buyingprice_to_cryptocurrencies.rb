class AddBuyingpriceToCryptocurrencies < ActiveRecord::Migration[6.0]
  def change
    add_column :cryptocurrencies, :buying_price, :float
  end
end
