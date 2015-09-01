class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :position, default: 0
      t.boolean :display, default: true
      t.text :content

      t.timestamps null: false
    end
  end
end
