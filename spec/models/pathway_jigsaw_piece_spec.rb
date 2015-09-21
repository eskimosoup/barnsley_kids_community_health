require 'rails_helper'

RSpec.describe PathwayJigsawPiece, type: :model do
  subject(:pathway_jigsaw_piece){ build(:pathway_jigsaw_piece) }

  describe "validations", :validation do
    it { should validate_presence_of(:pathway_section) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(PathwayJigsawPiece::COLOURS) }
  end

  describe "associations", :association do
    it { should belong_to(:pathway_section).counter_cache }
  end
end
