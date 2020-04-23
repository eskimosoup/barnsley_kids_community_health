class ContactsController < ApplicationController

  before_action :set_contact_detail

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.valid?
      ContactMailer.new_contact(@contact, @contact_detail).deliver_now
      redirect_to new_contact_path, notice: "Thank you for contacting us"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email, :message)
  end

  def set_contact_detail
    @contact_detail = ContactDetail.for_service(@service)
    @presented_contact_detail = ContactDetailPresenter.new(object: @contact_detail, view_template: view_context) if @contact_detail
  end
end
