require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "validations", :validation do
    subject(:service) { build(:service) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(Service::COLOURS) }
    it { should validate_uniqueness_of(:name) }
  end
end
