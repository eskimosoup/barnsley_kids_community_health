require 'rails_helper'

RSpec.describe ServicePresenter, type: :presenter do
  let(:service) { create(:service) }
  subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view) }

  describe "standard service" do
    it "returns service title" do
      expect(service_presenter.name).to eq(service.name)
    end

    it "returns the colour" do
      expect(service_presenter.colour).to eq(service.colour)
    end

    it "correctly escapes html on overview" do
      content = raw(service.overview)
      expect(service_presenter.overview).to eq(content)
    end
  end

end
