class BannerPresenter < BasePresenter
  presents :banner

  delegate :name, to: :banner

  def content
    h.raw banner.content
  end

  def homepage_image
    h.image_tag banner.image.homepage
  end
end