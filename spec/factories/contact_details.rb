FactoryGirl.define do
  factory :contact_detail do
    service
    sequence(:name){|n| "Contact Detail #{ n }"}
    address "<p>My Address</p>"
    postcode "MyString"
    phone_number "MyString"
    email "test@optimised.today"
    opening_hours "<p>Opening hours</p>"
  end

end
