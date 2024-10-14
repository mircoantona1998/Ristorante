class CreateTables < ActiveRecord::Migration[7.2]
  def change
    create_table :tables do |t|
      t.integer :numero
      t.integer :posti
      t.boolean :disponibile
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
