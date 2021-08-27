class TransactionsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_create_params, only: :create

  def index
    wallet = current_user.wallet
    transactions = wallet.transactions
    render json: transactions
  end

  def create
    is_buy = @transaction_amount.negative?
    is_invalid_amount = if is_buy
                          @wallet.clp < @transaction_amount * -1
                        else
                          @balance.amount * @crypto.buying_price < @transaction_amount
                        end

    is_partner = current_user.partner

    if is_invalid_amount && !is_partner
      render json: {},  status: :bad_request

    elsif !is_buy

      update_amounts

      sell_handler

    elsif is_buy

      buy_handler
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :cryptocurrency_name)
  end

  def set_create_params
    @wallet = current_user.wallet
    @new_amount = @wallet.clp + transaction_params[:amount]
    @transaction_amount = transaction_params[:amount]
    @crypto = Cryptocurrency.find_by(name: transaction_params[:cryptocurrency_name])
    @market = Market.find_by(id: 1)
    @balance = @wallet.balances.where(cryptocurrency_id: @crypto.id).first
  end

  def buy_btf
    @wallet.update({ clp: @new_amount })
    @updated_balance = @wallet.balances[0].amount + @transaction_amount * -1 / @crypto.selling_price
    @wallet.balances[0].update({ amount: @updated_balance })
    @new_crypto_amount = @market.btf + @transaction_amount / @crypto.selling_price
    @market.update({ btf: @new_crypto_amount })
    @crypto.update({ selling_price: @crypto.selling_price * (1 + 0.03) })
    @transaction = Transaction.create(amount: transaction_params[:amount], cryptocurrency_id: @crypto.id, wallet_id: @wallet.id)
    
    TransactionMailer.transaction_email(@transaction, @crypto, current_user).deliver
    render json: @transaction, status: :created
  end

  def buy_bth
    @wallet.update({ clp: @new_amount })
    @updated_balance = @wallet.balances[1].amount + @transaction_amount * -1 / @crypto.selling_price
    @wallet.balances[1].update({ amount: @updated_balance })
    @new_crypto_amount = @market.bth + @transaction_amount / @crypto.selling_price
    @market.update({ bth: @new_crypto_amount })
    @crypto.update({ selling_price: @crypto.selling_price * (1 + 0.03) })
    @transaction = Transaction.create(amount: transaction_params[:amount], cryptocurrency_id: @crypto.id, wallet_id: @wallet.id)

    TransactionMailer.transaction_email(@transaction, @crypto, current_user).deliver
    render json: @transaction, status: :created
  end
  
  def sell_handler
    if @crypto.name == "BTF"
      @new_crypto_amount = @market.btf + @transaction_amount / @crypto.buying_price
      @market.update({ btf: @new_crypto_amount })

    else
      @new_crypto_amount = @market.bth + @transaction_amount / @crypto.buying_price
      @market.update({ bth: @new_crypto_amount })

    end

    @crypto.update({ buying_price: @crypto.buying_price * (1 - 0.03) })
    @transaction = Transaction.create(amount: transaction_params[:amount], cryptocurrency_id: @crypto.id, wallet_id: @wallet.id)

    TransactionMailer.transaction_email(@transaction, @crypto, current_user).deliver
    render json: @transaction, status: :created
  end

  def buy_handler
    if @crypto.name == "BTF" && @market.btf >= @transaction_amount * -1 / @crypto.selling_price
      buy_btf

    elsif @crypto.name == "BTH" && @market.bth >= @transaction_amount * -1 / @crypto.selling_price
      buy_bth

    else
      render json: {},  status: :bad_request
    end
  end


  #update market and balances
  def update_amounts
    @wallet.update({ clp: @new_amount })
    @updated_balance = @balance.amount - @transaction_amount / @crypto.buying_price
    @balance.update({ amount: @updated_balance })
  end


end
