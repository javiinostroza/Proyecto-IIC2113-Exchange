class CryptocurrenciesController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @cryptocurrencies = Cryptocurrency.all
    render json: @cryptocurrencies
  end
end
