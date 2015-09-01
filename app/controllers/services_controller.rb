class ServicesController < ApplicationController

  before_action :set_service, only: :show

  def index

  end

  def show
    @presented_service = ServicePresenter.new(object: @service, view_template: view_context)
    @presented_testimonials = BaseCollectionPresenter.new(collection: @service.testimonials.displayed, view_template: view_context, presenter: TestimonialPresenter)
    @presented_faqs = BaseCollectionPresenter.new(collection: @service.frequently_asked_questions.displayed, view_template: view_context,
                                                  presenter: FrequentlyAskedQuestionPresenter)
  end

  private

  def set_service
    @service = Service.displayed.friendly.find(params[:id])
  end
end