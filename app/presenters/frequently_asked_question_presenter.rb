class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question
  delegate :question, to: :frequently_asked_question

  def answer
    h.raw frequently_asked_question.answer
  end
end