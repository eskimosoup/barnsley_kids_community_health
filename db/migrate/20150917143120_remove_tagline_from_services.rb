class RemoveTaglineFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :tagline, :string
  end
end
