require 'rails_helper'

RSpec.describe ContactDetail, type: :model do
  describe "validations", :validation do
    subject(:contact_detail) { create(:contact_detail) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:service_id) }
  end

  describe "associations", :association do
    it { should belong_to(:service) }
  end
end
