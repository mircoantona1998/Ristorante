class CreateBroughts < ActiveRecord::Migration[7.2]
  def change
    create_table :broughts do |t|
      t.string :nome
      t.decimal :prezzo
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
