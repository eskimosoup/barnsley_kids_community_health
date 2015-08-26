require 'rails_helper'

RSpec.feature "ContactingTheSiteOwners", type: :feature do
  it "should send an email when submitting the contact form" do
    visit new_contact_path
    expect(current_path).to eq(new_contact_path)
    within("h1") do
      expect(page).to have_content("Contact Us")
    end
    fill_in "contact[name]", with: "Joe Bloggs"
    fill_in "contact[phone_number]", with: "01482 666999"
    fill_in "contact[email]", with: "joebloggs@example.com"
    fill_in "contact[message]", with: "Contacting the site"
    click_button "Send"
    expect(page).to have_content "Thank you for contacting us"
    expect(last_email.to).to include(site_email)
    expect(last_email.subject).to include(site_name)
    expect(ActionMailer::Base.deliveries.count).to eq(1)

  end
end
