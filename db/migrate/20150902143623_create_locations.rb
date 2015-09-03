class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.text :content
      t.text :opening_times
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
