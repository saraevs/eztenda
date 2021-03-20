class RemoveProductCategoryStringFromListingDeal < ActiveRecord::Migration[6.1]
  def change
    remove_column :listing_deals, :product
    remove_column :listing_deals, :category
  end
end
