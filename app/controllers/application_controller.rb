class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :set_navigation

  def index
    @presented_banners = BaseCollectionPresenter.new(collection: Banner.displayed.order(position: :asc), view_template: view_context, presenter: BannerPresenter)
    @presented_services = BaseCollectionPresenter.new(collection: Service.displayed.order(position: :asc), view_template: view_context, presenter: ServicePresenter)
    @presented_article = ArticlePresenter.new(object: Article.published.order(date: :desc).first, view_template: view_context)
  end

  private

  def set_navigation
    @header_menu = Optimadmin::Menu.new(name: "header")
    @footer_menu = Optimadmin::Menu.new(name: "footer")
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end
