require "rails_helper"

RSpec.describe PathwayJigsawPiecePresenter, type: :presenter do
  let(:pathway_jigsaw_piece) { create(:pathway_jigsaw_piece) }
  subject(:pathway_jigsaw_piece_presenter) { PathwayJigsawPiecePresenter.new(object: pathway_jigsaw_piece, view_template: view) }

  describe "accessing attributes" do
    it "returns the name" do
      expect(pathway_row_presenter.name).to eq(pathway_row.name)
    end

    it "returns the colour" do
      expect(pathway_row_presenter.colour).to eq(pathway_row.colour)
    end
  end
end