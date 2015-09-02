require 'rails_helper'

RSpec.describe Page, type: :model do
  describe "validations", :validation do
    subject(:page) { build(:page) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:suggested_url).with_message('is not unique, leave this blank to generate automatically') }
  end
end
