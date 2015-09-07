class TestimonialsController < ApplicationController

  def index
    @presented_testimonials = BaseCollectionPresenter.new(collection: Testimonial.for_service(@service).displayed.page(params[:page]).per(10),
                                                                        view_template: view_context, presenter: TestimonialPresenter)
  end

end