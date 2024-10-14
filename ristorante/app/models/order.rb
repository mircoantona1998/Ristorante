class Order < ApplicationRecord
  belongs_to :table
  has_many :order_broughts  
  has_many :broughts, through: :order_broughts  

  def brought_quantities
    order_broughts.each_with_object({}) do |order_brought, hash|
      hash[order_brought.brought_id] = order_brought.quantita
    end
  end
end
