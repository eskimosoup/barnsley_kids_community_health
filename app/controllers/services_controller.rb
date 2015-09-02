class ServicesController < ApplicationController
  def index
    @presented_services = BaseCollectionPresenter.new(collection: Service.displayed.order(position: :asc), view_template: view_context, presenter: ServicePresenter)
  end
end