class Product < ApplicationRecord
  has_many :listing_deals, dependent: :destroy
  has_many :bids, dependent: :destroy
end
