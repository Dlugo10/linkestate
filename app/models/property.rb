require "ruby_linear_regression"

class Property < ApplicationRecord
  belongs_to :user


  has_many :tax_histories, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address 
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    
    def estimated_value
      # do the calculation and return the end result
      x_data = []
      y_data = []

      Property.all.each do |property|

        x_data.push( [property.sq_meters_land, property.sq_meters + property.sq_meters_added] )
        y_data.push( property.price )

        
      end

      # Create regression model
      linear_regression = RubyLinearRegression.new
      # Load training data
      linear_regression.load_training_data(x_data, y_data)

      # Train the model using the normal equation
      linear_regression.train_normal_equation

      # Predict the price of a 2000 sq feet property with a 1500 sq feet house
      prediction_data = [sq_meters_land, sq_meters + sq_meters_added]
      predicted_price = linear_regression.predict(prediction_data)
      return predicted_price
    end

end
