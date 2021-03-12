class Property < ApplicationRecord
  belongs_to :user

  has_many :tax_histories, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address 
  after_validation :geocode, if: :will_save_change_to_address?
end
