class ListingDealsController < ApplicationController
  before_action :find_listing_deal, only: [:show, :edit, :destroy]

  def index
    @listing_deals = ListingDeal.all
  end

  def show
    @bids = @listing_deal.bids
  end

  def new
    @listing_deal = ListingDeal.new
  end

  def create
    @listing_deal = ListingDeal.new(listing_deal_params)
    @listing_deal.user = current_user
    if @listing_deal.save
      redirect_to listing_deal_path(@listing_deal), alert: "Deal listed successfully"
    else
      render :new
    end
  end







  private

  def find_listing_deal
    @listing_deal = ListingDeal.find(params[:id])
  end

  def listing_deal_params
    params.require(:listing_deal).permit(:product_id, :user_id, :min_amount, :other_requirements, :time_period, :volume, :completed_at)
  end

end
