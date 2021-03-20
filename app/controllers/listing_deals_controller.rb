class ListingDealsController < ApplicationController
  def show
    @listing_deal = ListingDeal.find(params[:id])
    @bid = Bid.new
  end
end
