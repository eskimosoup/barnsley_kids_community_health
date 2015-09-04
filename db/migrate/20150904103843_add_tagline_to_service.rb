class AddTaglineToService < ActiveRecord::Migration
  def change
    add_column :services, :tagline, :string
    change_column :contact_details, :phone_number, :text
  end
end
