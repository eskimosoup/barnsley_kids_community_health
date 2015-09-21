require "rails_helper"

RSpec.describe PathwayRowPresenter, type: :presenter do
  let(:pathway_row) { create(:pathway_row) }
  subject(:pathway_row_presenter) { PathwayRowPresenter.new(object: pathway_row, view_template: view) }

  describe "accessing attributes" do
    it "returns the name" do
      expect(pathway_row_presenter.name).to eq(pathway_row.name)
    end

    it "returns the content using raw" do
      expect(pathway_row_presenter.content).to eq(raw(pathway_row.content))
    end

    it "returns the colour" do
      expect(pathway_row_presenter.colour).to eq(pathway_row.colour)
    end

  end
end