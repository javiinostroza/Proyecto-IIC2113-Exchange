class AddBtfToMarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :markets, :btf, :float
  end
end
