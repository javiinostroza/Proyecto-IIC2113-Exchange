class Cryptocurrency < ApplicationRecord
  has_many :transactions
  has_many :balances
end

# == Schema Information
#
# Table name: cryptocurrencies
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  buying_price  :float
#  selling_price :float
#
