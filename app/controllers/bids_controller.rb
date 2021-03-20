class BidsController < ApplicationController
  before_action :find_listing_deal, only: [ :new, :create ]

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.listing_deal = @listing_deal
    @bid.product = @listing_deal.product
    if @bid.save
      redirect_to listing_deal_path(@listing_deal.id)
    else
      render 'listing_deals/show'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

  def find_listing_deal
    @listing_deal = ListingDeal.find(params[:listing_deal_id])
  end
end
