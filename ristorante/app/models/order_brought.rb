class OrderBrought < ApplicationRecord
  belongs_to :order
  belongs_to :brought

end
