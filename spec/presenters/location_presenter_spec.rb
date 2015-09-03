require "rails_helper"

RSpec.describe LocationPresenter, type: :presenter do
  let(:location) { build(:location) }
  subject(:location_presenter) { LocationPresenter.new(object: location, view_template: view) }

  describe "standard location" do
    it "returns the name" do
      expect(location_presenter.name).to eq(location.name)
    end

    it "escapes html on opening times" do
      content = raw(location.opening_times)
      expect(location_presenter.opening_times).to eq(content)
    end
    it "escapes html on content" do
      content = raw(location.content)
      expect(location_presenter.content).to eq(content)
    end
  end
end