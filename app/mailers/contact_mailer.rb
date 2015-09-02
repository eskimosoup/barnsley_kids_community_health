class ContactMailer < ApplicationMailer

  def new_contact(contact, contact_detail)
    @contact = contact
    if contact_detail
      mail to: contact_detail.email, subject: "Contact Form Completed #{ [site_name, contact_detail.service_name].compact.join(" - ") }"
    else
      mail to: site_email, subject: "Contact Form Completed #{ site_name }"
    end
  end
end
