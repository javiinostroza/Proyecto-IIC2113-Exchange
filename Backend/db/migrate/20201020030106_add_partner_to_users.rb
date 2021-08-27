class AddPartnerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :partner, :boolean, default: false
  end
end
