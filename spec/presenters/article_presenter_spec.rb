require 'rails_helper'

RSpec.describe ArticlePresenter, type: :presenter do
  let(:article) { create(:article) }
  subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

  describe "standard article accessing model attributes" do
    it "returns the article id" do
      expect(article_presenter.id).to eq(article.id)
    end

    it "returns article title" do
      expect(article_presenter.title).to eq(article.title)
    end

    it "formats date to long by default" do
      date = view.content_tag :span, class: 'date' do
        l article.date, format: :long
      end
      expect(article_presenter.date).to eq(date)
    end

    it "format date to set format" do
      date = view.content_tag :span, class: 'date' do
        l article.date, format: :short
      end
      expect(article_presenter.date(:short)).to eq(date)
    end

    it "uses simple format on summary" do
      summary = view.simple_format(article.summary)
      expect(article_presenter.summary).to eq(summary)
    end

    it "correctly escapes html on content" do
      content = raw(article.content)
      expect(article_presenter.content).to eq(content)
    end
  end

  describe "article without image" do
    describe "images wrapped in a div" do
      it "returns nil when index_image_div method called" do
        expect(article_presenter.index_image_div).to be nil
      end

      it "returns nil when home_image_div method called" do
        expect(article_presenter.home_image_div).to be nil
      end
    end

    describe "images" do
      it "returns nil when index image called" do
        expect(article_presenter.index_image).to be nil
      end

      it "returns nil when home image called" do
        expect(article_presenter.home_image).to be nil
      end

      it "returns nil when show image called" do
        expect(article_presenter.show_image).to be nil
      end
    end
  end

  describe "article with an image" do
    let(:article) { create(:article_with_image) }
    subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

    describe "images wrapped in a div" do
      it "returns index image when index_image_div method called" do
        image_div = view.content_tag :div, view.image_tag(article.image.index), class: "small-4 columns"
        expect(article_presenter.index_image_div).to eq image_div
      end

      it "returns home image when home_image_div method called" do
        image_div = view.content_tag :div, view.image_tag(article.image.homepage), class: "small-4 columns"
        expect(article_presenter.home_image_div).to eq image_div
      end
    end

    describe "images" do
      it "returns nil when index image called" do
        image = view.image_tag(article.image.index)
        expect(article_presenter.index_image).to eq image
      end

      it "returns nil when home image called" do
        image = view.image_tag(article.image.homepage)
        expect(article_presenter.home_image).to eq image
      end

      it "returns nil when show image called" do
        image = view.image_tag(article.image.show)
        expect(article_presenter.show_image).to eq image
      end
    end
  end
end
