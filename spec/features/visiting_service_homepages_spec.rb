require 'rails_helper'

RSpec.feature "VisitingServiceHomepages", type: :feature do
  describe "services home page" do
    let!(:service) { create(:service) }

    # Set Capybara to use a given subdomain.
    before(:each) { Capybara.default_host = "http://#{ service.subdomain }.example.com" }
    after(:each)  { Capybara.default_host = "http://www.example.com" }

    it "should allow user to view a service" do
      visit root_path
      expect(page).to have_content(service.name)
    end
  end
end
