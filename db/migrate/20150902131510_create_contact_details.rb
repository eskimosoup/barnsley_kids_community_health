class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.string :name, null: false
      t.text :address
      t.string :postcode
      t.string :phone_number
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
