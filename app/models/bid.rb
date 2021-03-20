class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :listing_deal
  belongs_to :user
end
