class AddSubdomainAndMenuNameToService < ActiveRecord::Migration
  def change
    add_column :services, :subdomain, :string, null: false
    add_column :services, :menu_name, :string, null: false
  end
end
