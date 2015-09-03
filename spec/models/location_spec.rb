require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:opening_times) }
  end

  describe "associations", :association do
    it { should have_many(:service_locations).dependent(:destroy) }
    it { should have_many(:services).through(:service_locations) }
  end

end
