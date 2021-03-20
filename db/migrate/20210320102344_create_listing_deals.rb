class CreateListingDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_deals do |t|
      t.integer :min_amount
      t.text :other_requirements
      t.string :time_period
      t.string :volume
      t.date :start_date
      t.date :end_date
      t.date :completed_at
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
