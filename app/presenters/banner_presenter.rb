class BannerPresenter < BasePresenter
  presents :banner

  delegate :name, :link, to: :banner

  def linked_name
    if link
      h.link_to name, link
    else
      name
    end
  end

  def content
    h.raw banner.content
  end

  def linked_homepage_image
    if link
      h.link_to homepage_image, link
    else
      homepage_image
    end
  end

  def homepage_image
    h.image_tag banner.image.homepage
  end
end