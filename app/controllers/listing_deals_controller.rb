class ListingDealsController < ApplicationController
  def index
    @listing_deals = ListingDeal.all
  end
end
