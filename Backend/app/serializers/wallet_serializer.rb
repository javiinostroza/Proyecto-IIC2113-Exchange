class WalletSerializer < ActiveModel::Serializer
  attributes :id, :clp
  has_one :user
end
