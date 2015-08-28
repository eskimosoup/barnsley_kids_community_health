class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :icon
      t.string :image
      t.text :overview
      t.string :colour, null: false
      t.boolean :display, default: true
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
