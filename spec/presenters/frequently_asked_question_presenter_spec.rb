require 'rails_helper'

RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter do
  let(:frequently_asked_question) { create(:frequently_asked_question) }
  subject(:frequently_asked_question_presenter) { FrequentlyAskedQuestionPresenter.new(object: frequently_asked_question, view_template: view) }

  describe "standard frequently_asked_question" do
    it "returns question" do
      content = link_to frequently_asked_question.question, '#', class: 'toggle-class',
          data: { container: ".faq-#{frequently_asked_question.id}", class: 'hide', return: 'false'  }
      expect(frequently_asked_question_presenter.question).to eq(content)
    end

    it "correctly escapes html on answer" do
      content = content_tag :div, class: "faq-#{frequently_asked_question.id} hide" do
        raw frequently_asked_question.answer
      end
      expect(frequently_asked_question_presenter.answer).to eq(content)
    end
  end

end