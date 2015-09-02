class AddServiceToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :service, index: true, foreign_key: true
  end
end
