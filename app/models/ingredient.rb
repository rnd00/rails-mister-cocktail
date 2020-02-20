class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :name }
  has_many :dose
end
