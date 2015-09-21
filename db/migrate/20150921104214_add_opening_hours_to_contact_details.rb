class AddOpeningHoursToContactDetails < ActiveRecord::Migration
  def change
    add_column :contact_details, :opening_hours, :text
  end
end
