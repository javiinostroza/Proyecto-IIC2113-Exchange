class TransactionMailer < ApplicationMailer
    default from: 'exchangetendds@gmail.com'
 
    def transaction_email(transaction, cryptocurrency, current_user)
      @cryptocurrency = cryptocurrency
      @transaction = transaction
      @user = current_user
      @is_buy = @transaction.amount.negative?
      mail(to: @user.email, subject: 'Transacción Exitosa!')
    end
end
