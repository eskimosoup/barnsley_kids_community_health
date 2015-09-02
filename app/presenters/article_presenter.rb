class ArticlePresenter < BasePresenter
  presents :article

  def title
    article.title
  end

  def linked_title
    h.link_to article.title, article
  end

  def summary(length = nil)
    h.simple_format article_summary(length)
  end

  def content
    h.raw article.content
  end

  def date(format = :long)
    h.content_tag :div, class: 'article-date' do
      h.l article.date, format: format
    end
  end

  def read_more
    h.link_to "Read More", article, class: "button read-more"
  end

  def classes
    if image?
      "medium-8 columns"
    else
      "medium-12 columns"
    end
  end

  def index_image_div
    return nil unless index_image
    h.content_tag :div, index_image, class: "medium-4 columns"
  end

  def home_image_div
    return nil unless home_image
    h.content_tag :div, (h.link_to home_image, article, title: article.title), class: "medium-4 columns"
  end

  def index_image
    return nil unless image?
    image(:index)
  end

  def home_image
    return nil unless image?
    image(:homepage)
  end

  def show_image
    return nil unless image?
    image(:show)
  end

  private

  def article_summary(length)
    summary = article.summary if length.blank?
    summary = h.truncate(article.summary, length: length) unless length.blank?
    summary
  end

  def image?
    article.image?
  end

  def image(version)
    h.image_tag article.image.url(version), alt: article.title
  end
end
