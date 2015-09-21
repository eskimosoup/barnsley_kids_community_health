require "rails_helper"

RSpec.describe ContactDetailPresenter, type: :presenter do
  let(:contact_detail) { build(:contact_detail) }
  subject(:contact_detail_presenter) { ContactDetailPresenter.new(object: contact_detail, view_template: view) }

  describe "standard contact_detail" do
    it "should return the name" do
      expect(contact_detail_presenter.name).to eq(contact_detail.name)
    end

    it "should return the phone_number using simple format" do
      expect(contact_detail_presenter.phone_number).to eq(simple_format(contact_detail.phone_number))
    end

    it "should return the postcode" do
      expect(contact_detail_presenter.postcode).to eq(contact_detail.postcode)
    end

    it "should escape the address" do
      expect(contact_detail_presenter.address).to eq(raw(contact_detail.address))
    end

    it "should escape the opening hours" do
      expect(contact_detail_presenter.opening_hours).to eq(raw(contact_detail.opening_hours))
    end
  end
end