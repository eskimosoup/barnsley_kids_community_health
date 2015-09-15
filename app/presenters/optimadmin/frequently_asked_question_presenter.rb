module Optimadmin
  class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
    presents :frequently_asked_question
    delegate :question, to: :frequently_asked_question

    def toggle_title
      inline_detail_toggle_link(question)
    end

    def optimadmin_summary
      h.raw frequently_asked_question.answer
    end

    def services
      h.content_tag :div, frequently_asked_question.services.pluck(:name).join(', '), style: 'font-size:12px;line-height:1.2;' if frequently_asked_question.services.present?
    end
  end
end
