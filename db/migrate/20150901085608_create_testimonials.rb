class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name, null: false
      t.string :author
      t.text :content, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
