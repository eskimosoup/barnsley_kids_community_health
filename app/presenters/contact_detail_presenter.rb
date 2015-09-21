class ContactDetailPresenter < BasePresenter
  presents :contact_detail

  delegate :name, :postcode, to: :contact_detail, allow_nil: true

  def address
    h.raw contact_detail.address
  end

  def opening_hours
    h.raw contact_detail.opening_hours
  end

  def phone_number
    return nil if contact_detail.phone_number.blank?
    h.simple_format contact_detail.phone_number
  end
end
