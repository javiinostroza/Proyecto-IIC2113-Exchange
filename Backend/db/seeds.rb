# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Write the code in a way that can be executed multiple times without duplicating the information.
#
# For example:
#
# Country.create(name: "Chile") # BAD
# Country.find_or_create_by(name: "Chile") # GOOD
#
AdminUser.create(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"], password_confirmation: ENV["ADMIN_PASSWORD_CONFIRMATION"])
Market.create(clp: ENV["CLP_AMOUNT"], btf: ENV["BTF_AMOUNT"], bth: ENV["BTH_AMOUNT"])
Cryptocurrency.create(selling_price: ENV["BTF_SELLING_PRICE"], buying_price: ENV["BTF_BUYING_PRICE"], name: "BTF")
Cryptocurrency.create(selling_price: ENV["BTH_SELLING_PRICE"], buying_price: ENV["BTH_BUYING_PRICE"], name: "BTH")
User.create(email: ENV["PARTNER_EMAIL"], password: ENV["PARTNER_PASSWORD"], password_confirmation: ENV["PARTNER_PASSWORD_CONFIRMATION"], name: 'fernanda', lastname: 'sepúlveda', partner: true)
Wallet.create(clp: rand(10000..100000), user_id: 1)
Balance.create(amount: 0, wallet_id: 1, market_id: 1, cryptocurrency_id: 1)
Balance.create(amount: 0, wallet_id: 1, market_id: 1, cryptocurrency_id: 2)