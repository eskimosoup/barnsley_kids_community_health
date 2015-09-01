require 'rails_helper'

RSpec.feature "ViewingServices", type: :feature do
  describe "services index page" do
    let!(:services) { create_list(:service, 4) }

    it "should allow user to view a service" do
      visit services_path

    end
  end

  describe "services show page" do
    it "should allow user to view a page" do
      service = create(:service)
      visit service_path(service)
      expect(current_path).to eq(service_path(service))

      within("h1") do
        expect(service).to have_content(service.title)
      end

      expect(service).to have_content(service.content)
    end

    it "should not allow a page to be viewed" do
      service = create(:service, display: false)
      expect{ visit service_path(service) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
