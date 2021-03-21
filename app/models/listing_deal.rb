class ListingDeal < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :user, presence: true
  validates :min_amount, presence: true
  validates :volume, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
