class ApplicationMailer < ActionMailer::Base
  default from: 'exchangetendds@gmail.com'
  layout 'mailer'
end

# app/mailers/transaction_mailer.rb
class TransactionMailer < ApplicationMailer
end
