class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.integer :clp

      t.timestamps
    end
  end
end
