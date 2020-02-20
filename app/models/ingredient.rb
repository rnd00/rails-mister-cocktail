class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses

  def to_label
    name.capitalize
  end
end
