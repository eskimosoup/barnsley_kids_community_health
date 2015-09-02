require 'rails_helper'

RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter do
  let(:frequently_asked_question) { create(:frequently_asked_question) }
  subject(:frequently_asked_question_presenter) { FrequentlyAskedQuestionPresenter.new(object: frequently_asked_question, view_template: view) }

  describe "standard frequently_asked_question" do
    it "returns question" do
      expect(frequently_asked_question_presenter.question).to eq(frequently_asked_question.question)
    end

    it "correctly escapes html on answer" do
      content = raw(frequently_asked_question.answer)
      expect(frequently_asked_question_presenter.answer).to eq(content)
    end
  end

end