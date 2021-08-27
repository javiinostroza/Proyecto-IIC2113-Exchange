class BalancesController < InheritedResources::Base
  before_action :authenticate_user!
  def index
    @wallet = current_user.wallet
    @balances =  @wallet.balances
    render json: @balances
  end
end
