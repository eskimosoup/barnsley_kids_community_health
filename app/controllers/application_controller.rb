class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings

  def index
    @presented_articles = BaseCollectionPresenter.new(collection: Article.published.order(date: :desc).limit(3), view_template: view_context, presenter: ArticlePresenter)
  end

  private

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings
end