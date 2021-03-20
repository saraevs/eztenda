class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.text :description
      t.boolean :accepted
      t.boolean :rejected
      t.references :product, null: false, foreign_key: true
      t.references :listing_deal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
