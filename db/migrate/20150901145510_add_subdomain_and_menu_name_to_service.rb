class AddSubdomainAndMenuNameToService < ActiveRecord::Migration
  def change
    add_column :services, :subdomain, :string
    add_column :services, :menu_name, :string
  end
end
