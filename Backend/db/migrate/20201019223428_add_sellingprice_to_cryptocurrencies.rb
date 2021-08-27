class AddSellingpriceToCryptocurrencies < ActiveRecord::Migration[6.0]
  def change
    add_column :cryptocurrencies, :selling_price, :float
  end
end
