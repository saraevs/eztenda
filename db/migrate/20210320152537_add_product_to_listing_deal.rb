class AddProductToListingDeal < ActiveRecord::Migration[6.1]
  def change
    add_column :listing_deals, :product, :string
    add_column :listing_deals, :category, :string
  end
end
