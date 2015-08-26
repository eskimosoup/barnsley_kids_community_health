require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:email) }

  context "phone number is set" do
    before { subject.phone_number = "47" }
    it { should_not validate_presence_of(:email) }
  end

  context "email is set" do
    before { subject.email = "support@optimised.today" }
    it { should_not validate_presence_of(:phone_number) }
  end
end
