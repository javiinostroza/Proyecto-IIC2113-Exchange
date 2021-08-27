class AddBthToMarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :markets, :bth, :float
  end
end
