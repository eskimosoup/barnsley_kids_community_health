require 'rails_helper'

RSpec.describe PathwaySection, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:pathway_rows) }
    it { should have_many(:pathway_jigsaw_pieces) }
  end
end
