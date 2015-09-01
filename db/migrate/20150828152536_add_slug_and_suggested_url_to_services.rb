class AddSlugAndSuggestedUrlToServices < ActiveRecord::Migration
  def change
    add_column :services, :slug, :string
    add_column :services, :suggested_url, :string
    add_index :services, :slug
  end
end
