class BalanceSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :wallet
  has_one :market
  has_one :cryptocurrency
end
