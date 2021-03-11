class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :address
      t.string :city
      t.integer :zip_code
      t.text :neighborhood_info
      t.string :neighborhood
      t.integer :sq_meters
      t.integer :estimated_price
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sq_meters_land
      t.integer :year_bought
      t.integer :price_bought
      t.integer :sq_meters_added
      t.integer :year_built
      t.integer :year_renovated
      t.float :latitude
      t.float :longitude
      t.boolean :beachfront
      t.boolean :waterfront
      t.boolean :pool
      t.string :propery_type
      t.boolean :central_air
      t.boolean :dishwasher
      t.boolean :washing_machine
      t.boolean :attached_garage

      t.timestamps
    end
  end
end
