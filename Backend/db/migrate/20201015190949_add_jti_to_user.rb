class AddJtiToUser < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :users, :jti, :string
    add_index :users, :jti, unique: true, algorithm: :concurrently
  end
end
