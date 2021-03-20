class ListingDeal < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :bids, dependent: :destroy
end
