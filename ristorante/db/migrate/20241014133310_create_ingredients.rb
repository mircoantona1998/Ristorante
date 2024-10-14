class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :nome
      t.float :giacenza
      t.string :unita_di_misura
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
