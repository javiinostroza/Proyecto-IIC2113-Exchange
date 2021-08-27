class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    @clp = rand(10000..100000)
    @new_user = resource
    @user_wallet = Wallet.new(clp: @clp, user_id: resource.id)
    @user_wallet.save
    @user_balance_btf = Balance.new(amount: 0, wallet_id: @user_wallet.id, market_id: 1, cryptocurrency_id: 1)
    @user_balance_btf.save
    @user_balance_bth = Balance.new(amount: 0, wallet_id: @user_wallet.id, market_id: 1, cryptocurrency_id: 2)
    @user_balance_bth.save
    render json: @new_user, status: :created
  end

  protected

  def sign_up_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation, :current_password)
  end
end
