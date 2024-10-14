class BroughtIngredient < ApplicationRecord
  belongs_to :brought
  belongs_to :ingredient
  validates :quantita, presence: true, numericality: true
end
