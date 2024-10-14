class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :table, null: false, foreign_key: true
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end

    unless index_exists?(:orders, :table_id)
      add_index :orders, :table_id
    end
  end
end
