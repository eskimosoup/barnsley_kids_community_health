require 'rails_helper'

RSpec.describe PathwayRow, type: :model do
  subject(:pathway_row) { build(:pathway_row) }
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(PathwayRow::COLOURS) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:pathway_section) }
  end

  describe "associations", :association do
    it { should belong_to(:pathway_section).counter_cache }
  end
end
