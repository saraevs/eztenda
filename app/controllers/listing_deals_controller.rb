class ListingDealsController < ApplicationController
  before_action :find_listing_deal, only: [:show, :edit, :destroy]

  def index
    @listing_deals = ListingDeal.all
  end

  def show
    @bids = @listing_deal.bids
  end


  private

  def find_listing_deal
    @listing_deal = ListingDeal.find(params[:id])
  end

end
