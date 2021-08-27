require "rails_helper"

RSpec.describe CryptocurrenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cryptocurrencies").to route_to("cryptocurrencies#index")
    end

    it "routes to #new" do
      expect(get: "/cryptocurrencies/new").to route_to("cryptocurrencies#new")
    end

    it "routes to #show" do
      expect(get: "/cryptocurrencies/1").to route_to("cryptocurrencies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cryptocurrencies/1/edit").to route_to("cryptocurrencies#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/cryptocurrencies").to route_to("cryptocurrencies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cryptocurrencies/1").to route_to("cryptocurrencies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cryptocurrencies/1").to route_to("cryptocurrencies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cryptocurrencies/1").to route_to("cryptocurrencies#destroy", id: "1")
    end
  end
end
