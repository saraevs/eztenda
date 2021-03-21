class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :listing_deal
  belongs_to :user

  validates :product, presence: true
  validates :listing_deal, presence: true
  validates :user, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  # validate :amount_cannot_be_less_than_min_amount

  def amount_cannot_be_less_than_min_amount
    min_amount = ListingDeal.find(listing_deal_id).min_amount
    if !amount
      errors.add(:amount, "Please enter and amount")
    elsif amount <= min_amount
      errors.add(:amount, "You need to bid at least the minimum amount." )
    end
  end
end
