class WalletsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    render json: current_user.wallet
  end
end
