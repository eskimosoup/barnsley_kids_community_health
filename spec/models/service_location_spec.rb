require 'rails_helper'

RSpec.describe ServiceLocation, type: :model do
  describe "associations", :association do
    it { should belong_to(:service) }
    it { should belong_to(:location) }
  end
end
