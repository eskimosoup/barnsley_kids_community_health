class CreatePathwayRows < ActiveRecord::Migration
  def change
    create_table :pathway_rows do |t|
      t.belongs_to :pathway_section, index: true, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.integer :position, default: 0
      t.string :colour, null: false
      t.text :content
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
