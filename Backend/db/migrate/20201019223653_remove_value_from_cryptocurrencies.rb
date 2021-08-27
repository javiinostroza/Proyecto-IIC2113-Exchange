class RemoveValueFromCryptocurrencies < ActiveRecord::Migration[6.0]
  def change
    safety_assured { remove_column :cryptocurrencies, :value, :float }
  end
end
