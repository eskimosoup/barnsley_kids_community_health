require 'rails_helper'

RSpec.describe FrequentlyAskedQuestion, type: :model do
  describe "validations", :validation do
    subject(:frequently_asked_question) { build(:frequently_asked_question) }
    it { should validate_presence_of(:question) }
    it { should validate_uniqueness_of(:question) }
    it { should validate_presence_of(:answer) }
  end

  describe "associations", :association do
    it { should have_many(:service_frequently_asked_questions).dependent(:destroy) }
    it { should have_many(:services).through(:service_frequently_asked_questions) }
  end
end
