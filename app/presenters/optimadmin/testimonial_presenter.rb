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

    def services
      h.content_tag :div, testimonial.services.pluck(:name).join(', '), style: 'font-size:12px;line-height:1.2;' if testimonial.services.present?
    end
  end
end
