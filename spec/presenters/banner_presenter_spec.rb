require "rails_helper"

RSpec.describe BannerPresenter, type: :presenter do
  let(:banner) { create(:banner) }
  subject(:banner_presenter) { BannerPresenter.new(object: banner, view_template: view) }

  describe "standard banner" do
    it "should return the name" do
      expect(banner_presenter.name).to eq(banner.name)
    end

    it "should escape html in content" do
      expect(banner_presenter.content).to eq(raw(banner.content))
    end

    it "should return the image in an image_tag" do
      expect(banner_presenter.homepage_image).to eq(image_tag(banner.image.homepage))
    end
  end
end