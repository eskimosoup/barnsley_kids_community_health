module Optimadmin
  class TestimonialPresenter < Optimadmin::BasePresenter
    presents :testimonial

    delegate :name, to: :testimonial

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw testimonial.content
    end
  end
end
