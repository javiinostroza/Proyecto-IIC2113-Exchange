class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :wallet
  has_one :cryptocurrency
end
