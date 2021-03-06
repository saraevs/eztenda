class ListingDealsController < ApplicationController
  before_action :find_listing_deal, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category]
      # raise
      @listing_deals = ListingDeal.where(category:  params[:category])
    else
      @listing_deals = ListingDeal.all
    end
  end

  def show
    @product = Product.find(@listing_deal.product_id)
    @bids = @listing_deal.bids
    @bid = Bid.new
    @accepted_bid = @bids.where(accepted: true).first
    @highest_bid = @bids.order("amount DESC").limit(1).first
  end

  def new
    @listing_deal = ListingDeal.new
  end

  def create
    @listing_deal = ListingDeal.new(listing_deal_params)
    @listing_deal.user = current_user
    @listing_deal.product_id = 1
    if @listing_deal.save
      redirect_to listing_deal_path(@listing_deal), alert: "Deal listed successfully"
    else
      raise
      render :new
    end
  end

  def update
    @listing_deal.update(listing_deal_params)
      if @listing_deal.save
        redirect_to listing_deal_path
      else
        render :new
      end
  end

  def destroy
    @listing_deal.destroy
    redirect_to listing_deals_path, alert: "Listing deleted"
  end

  private

  def find_listing_deal
    @listing_deal = ListingDeal.find(params[:id])
  end

  def listing_deal_params
    params.require(:listing_deal).permit(:product_id, :user_id, :min_amount, :other_requirements, :start_date, :end_date, :volume)
  end
end
