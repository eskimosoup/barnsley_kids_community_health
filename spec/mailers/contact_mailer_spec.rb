require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  let(:contact) { Contact.new(name: "Joe", phone_number: "47", email: "support@optimised.today", message: "blah")}

  describe "no contact details" do
    let(:mail) { ContactMailer.new_contact(contact, nil) }

    it "has the correct sender email" do
      expect(mail.from).to include('support@optimised.today')
    end

    it "has the correct sender email" do
      expect(mail.to).to include('support@optimised.today')
    end

    it "has the correct subject" do
      site_name = Optimadmin::SiteSetting.find_by(key: "Name")
      expect(mail.subject).to include(site_name.value)
    end
  end

  describe "with contact details" do
    let(:contact_detail) { build(:contact_detail) }
    let(:mail) { ContactMailer.new_contact(contact, contact_detail) }

    it "has the correct sender email" do
      expect(mail.from).to include('support@optimised.today')
    end

    it "has the correct sender email" do
      expect(mail.to).to include(contact_detail.email)
    end

    it "has the correct subject" do
      site_name = Optimadmin::SiteSetting.find_by(key: "Name")
      expect(mail.subject).to include(contact_detail.service_name, site_name.value)
    end
  end

end
