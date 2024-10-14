class Brought < ApplicationRecord
  has_many :brought_ingredients, dependent: :destroy
  has_many :ingredient, through: :brought_ingredients

  has_many :order_broughts, dependent: :destroy
  has_many :orders, through: :order_broughts
  
  validates :nome, presence: true
  def ingredient_quantities
    brought_ingredients.each_with_object({}) do |brought_ingredient, hash|
      hash[brought_ingredient.ingredient_id] = brought_ingredient.quantita
    end
  end
end
