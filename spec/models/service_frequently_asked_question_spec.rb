require 'rails_helper'

RSpec.describe ServiceFrequentlyAskedQuestion, type: :model do
  describe "associations", :association do
    it { should belong_to(:service) }
    it { should belong_to(:frequently_asked_question) }
  end
end
