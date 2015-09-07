class AddServiceHomeToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :service_home, :boolean, default: true
  end
end
