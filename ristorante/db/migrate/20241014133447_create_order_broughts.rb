class CreateOrderBroughts < ActiveRecord::Migration[7.2]
  def change
    create_table :order_broughts do |t|
      t.references :order, null: false, foreign_key: true
      t.references :brought, null: false, foreign_key: true
      t.float :quantita
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
    unless index_exists?(:order_broughts, :order_id)
      add_index :order_broughts, :order_id
    end
    unless index_exists?(:order_broughts, :brought_id)
      add_index :order_broughts, :brought_id
    end
  end
end
