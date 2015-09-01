class TestimonialPresenter < BasePresenter
  presents :testimonial

  delegate :name, :author, to: :testimonial

  def content
    h.raw testimonial.content
  end
end