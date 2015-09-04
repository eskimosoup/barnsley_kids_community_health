class ContactDetailPresenter < BasePresenter
  presents :contact_detail

  delegate :name, :postcode, to: :contact_detail, allow_nil: true

  def address
    return nil if contact_detail.address.blank?
    h.simple_format contact_detail.address
  end

  def phone_number
    return nil if contact_detail.phone_number.blank?
    h.simple_format contact_detail.phone_number
  end
end
