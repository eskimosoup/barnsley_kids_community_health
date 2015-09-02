require 'rails_helper'

RSpec.feature "ViewingServices", type: :feature do
  describe "services index page" do
    let!(:services) { create_list(:service, 4) }

    it "should allow user to view a service" do
      visit services_path
    end
  end
end
