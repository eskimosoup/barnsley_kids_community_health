class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :content, null: false
      t.text :opening_times
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
