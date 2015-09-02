module Optimadmin
  class ContactDetailPresenter < Optimadmin::BasePresenter
    presents :contact_detail

    delegate :name, to: :contact_detail
  end
end