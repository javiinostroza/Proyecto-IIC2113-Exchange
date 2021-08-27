class CryptocurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :buying_price, :selling_price
end
