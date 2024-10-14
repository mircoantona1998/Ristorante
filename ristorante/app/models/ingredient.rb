class Ingredient < ApplicationRecord
    has_many :brought_ingredients
    has_many :brought, through: :brought_ingredients
  
    validates :nome, presence: true
    validates :giacenza, presence: true, numericality: true
    validates :unita_di_misura, presence: true
  end
  