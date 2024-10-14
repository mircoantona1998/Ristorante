class CreateBroughtIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :brought_ingredients do |t|
      t.references :brought, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.float :quantita
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end

    # Verifica se l'indice esiste già prima di crearlo
    unless index_exists?(:brought_ingredients, :brought_id)
      add_index :brought_ingredients, :brought_id
    end

    unless index_exists?(:brought_ingredients, :ingredient_id)
      add_index :brought_ingredients, :ingredient_id
    end
  end
end
