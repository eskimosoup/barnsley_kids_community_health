class CreatePathwaySections < ActiveRecord::Migration
  def change
    create_table :pathway_sections do |t|
      t.string :name
      t.integer :position, default: 0
      t.integer :pathway_rows_count, default: 0
      t.integer :pathway_jigsaw_pieces_count, default: 0
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
