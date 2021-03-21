class BidsController < ApplicationController
  before_action :find_listing_deal, only: [ :new, :create, :update ]
  before_action :find_bid, only: [ :edit, :update ]

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.listing_deal = @listing_deal
    @bid.product = Product.find(@listing_deal.product_id)
    @bid.user = current_user
    if @bid.save
      redirect_to listing_deal_path(@listing_deal)
    else
      redirect_to listing_deal_path(@listing_deal), alert: "Unable to create listing"
    end
  end

  def edit
  end

  def update
    @bid.accepted = true
    @bid.save
    @listing_deal.completed_at = Date.today
    @listing_deal.save
    redirect_to listing_deal_path(@listing_deal)
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :description)
  end

  def find_listing_deal
    @listing_deal = ListingDeal.find(params[:listing_deal_id])
  end

  def find_bid
    @bid = Bid.find(params[:id])
  end
end
