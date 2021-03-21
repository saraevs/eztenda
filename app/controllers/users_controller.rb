class UsersController < ApplicationController
  before_action :find_user

  def show
    if !@user.is_venue
      @bids = Bid.where(user_id: @user.id)
    else
      @listing_deals = ListingDeal.where(user_id: @user.id)
      @accepted_listings = ListingDeal.where(user_id: @user.id).where.not(completed_at: [nil, ""])
      @active_listings = ListingDeal.where(user_id: @user.id, completed_at: [nil, ""])
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
