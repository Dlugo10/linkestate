class TaxHistory < ApplicationRecord
  belongs_to :property

  def self.to_line_chart

    hash = {}
    self.all.each do |th|
      hash[th.year.to_s] = th.value * th.tax / 100
    end
    hash
  end
end
