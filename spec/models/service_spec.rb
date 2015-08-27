require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
  end
end
