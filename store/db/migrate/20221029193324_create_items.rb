class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :reference
      t.integer :quantity
      t.float :price_unit
      t.references :color, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.boolean :flag_deleted

      t.timestamps
    end
  end
end
