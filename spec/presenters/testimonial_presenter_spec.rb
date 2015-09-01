require 'rails_helper'

RSpec.describe TestimonialPresenter, type: :presenter do
  let(:testimonial) { create(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

  describe "standard testimonial" do
    it "returns name" do
      expect(testimonial_presenter.name).to eq(testimonial.name)
    end

    it "returns author" do
      expect(testimonial_presenter.author).to eq(testimonial.author)
    end

    it "correctly escapes html on content" do
      content = raw(testimonial.content)
      expect(testimonial_presenter.content).to eq(content)
    end
  end

end