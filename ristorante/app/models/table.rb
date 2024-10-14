class Table < ApplicationRecord
    has_many :orders

    validates :numero, presence: true, uniqueness: { message: "esiste già un tavolo con questo numero" }
    validates :posti, presence: true
    validates :disponibile, inclusion: { in: [true, false] }
end
