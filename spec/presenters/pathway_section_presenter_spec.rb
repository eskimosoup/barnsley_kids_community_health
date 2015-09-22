require "rails_helper"

RSpec.describe PathwaySectionPresenter, type: :presenter do
  let(:pathway_section) { create(:pathway_section_with_rows_and_jigsaw_pieces ) }
  subject(:pathway_section_presenter) { PathwaySectionPresenter.new(object: pathway_section, view_template: view) }

  describe "delegations", :delegation do
    it { should delegate_method(:pathway_rows).to(:pathway_section) }
    it { should delegate_method(:pathway_jigsaw_pieces).to(:pathway_section) }
  end

  describe "wrapping pathway rows" do
    it "returns presented pathway rows" do
      expect(pathway_section_presenter.presented_pathway_rows.map(&:class)).to include(PathwayRowPresenter)
    end
  end

  describe "wrapping pathway jigsaw pieces" do
    it "returns presented pathway jigsaw pieces" do
      expect(pathway_section_presenter.presented_pathway_jigsaw_pieces.map(&:class)).to include(PathwayJigsawPiecePresenter)
    end
  end
end