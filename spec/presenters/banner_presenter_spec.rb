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

    it "should return nil with no link" do
      expect(banner_presenter.linked_name).to eq(banner.name)
    end
  end

  describe "banner with link" do
    let(:banner) { create(:banner, link: "http://www.google.co.uk") }
    subject(:banner_presenter) { BannerPresenter.new(object: banner, view_template: view) }
    it "should return nil with no link" do
      link = link_to banner.name, banner.link
      expect(banner_presenter.linked_name).to eq(link)
    end

    it "should return the image with a link" do
      linked_image = link_to image_tag(banner.image.homepage), banner.link
      expect(banner_presenter.linked_homepage_image).to eq(linked_image)
    end
  end
end