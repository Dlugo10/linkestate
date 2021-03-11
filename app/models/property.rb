class Property < ApplicationRecord
  belongs_to :user

  has_many :tax_histories, dependent: :destroy
end
