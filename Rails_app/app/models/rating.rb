class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  validates :grade, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0}
end
