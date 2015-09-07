class FrequentlyAskedQuestionsController < ApplicationController

  def index
    @presented_frequently_asked_questions = BaseCollectionPresenter.new(collection: FrequentlyAskedQuestion.for_service(@service).displayed.page(params[:page]).per(10),
                                                                        view_template: view_context, presenter: FrequentlyAskedQuestionPresenter)
  end
end