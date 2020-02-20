class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :name }
  has_many :doses
  has_many :ingredients, through: :doses
end
