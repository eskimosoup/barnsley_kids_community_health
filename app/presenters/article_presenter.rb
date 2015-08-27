class ArticlePresenter < BasePresenter
  presents :article

  def title
    article.title
  end

  def summary
    h.simple_format article.summary
  end

  def content
    h.raw article.content
  end

  def date(format = :long)
    h.content_tag :span, class: 'date' do
      h.l article.date, format: format
    end
  end

  def read_more
    h.link_to "Read More", article, class: "button read-more"
  end

  def classes
    if image?
      "small-8 columns"
    else
      "small-12 columns"
    end
  end

  def index_image_div
    return nil unless index_image
    h.content_tag :div, index_image, class: "small-4 columns"
  end

  def home_image_div
    return nil unless home_image
    h.content_tag :div, home_image, class: "small-4 columns"
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

  def image?
    article.image?
  end

  def image(version)
    h.image_tag article.image.url(version)
  end
end