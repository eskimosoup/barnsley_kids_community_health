require 'rails_helper'

RSpec.describe PagePresenter, type: :presenter do
  let(:page) { create(:page) }
  subject(:page_presenter) { PagePresenter.new(object: page, view_template: view) }

  describe "standard page attributes" do
    it "title returns page title" do
      expect(page_presenter.title).to eq(page.title)
    end

    it "correctly escapes html on content" do
      content = raw(page.content)
      expect(page_presenter.content).to eq(content)
    end
  end


  describe "images" do
    describe "page without an image" do
      it "should return nil when calling image" do
        expect(page_presenter.image).to be nil
      end
    end

    describe "page with an image" do
      let(:page) { create(:page_with_image) }
      subject(:page_presenter) { PagePresenter.new(object: page, view_template: view) }

      it "should return the image" do
        image = view.image_tag page.image.show, alt: page.title
        expect(page_presenter.image).to eq image
      end
    end
  end
end