class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question

  def question
    h.link_to frequently_asked_question.question, '#', class: 'toggle-class',
              data: { container: ".faq-#{frequently_asked_question.id}", class: 'hide', return: 'false'  }
  end

  def answer
    h.content_tag :div, class: "faq-#{frequently_asked_question.id} hide" do
      h.raw frequently_asked_question.answer
    end
  end
end
