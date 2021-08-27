# == Schema Information
#
# Table name: balances
#
#  id                :bigint(8)        not null, primary key
#  amount            :float
#  wallet_id         :bigint(8)        not null
#  market_id         :bigint(8)        not null
#  cryptocurrency_id :bigint(8)        not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_balances_on_cryptocurrency_id  (cryptocurrency_id)
#  index_balances_on_market_id          (market_id)
#  index_balances_on_wallet_id          (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (cryptocurrency_id => cryptocurrencies.id)
#  fk_rails_...  (market_id => markets.id)
#  fk_rails_...  (wallet_id => wallets.id)
#
module BalancesHelper
end
