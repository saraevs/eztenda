class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :listing_deal
  belongs_to :user

  validates :product, presence: true
  validates :listing_deal, presence: true
  validates :user, presence: true
  validates :amount, presence: true

end
