class ContactDetailPresenter < BasePresenter
  presents :contact_detail

  delegate :name, :postcode, :phone_number, to: :contact_detail, allow_nil: true

  def address
    return nil if contact_detail.address.blank?
    h.simple_format contact_detail.address
  end
end