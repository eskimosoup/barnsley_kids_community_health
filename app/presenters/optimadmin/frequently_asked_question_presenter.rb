module Optimadmin
  class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
    presents :frequently_asked_question
    delegate :question, to: :frequently_asked_question
  end
end