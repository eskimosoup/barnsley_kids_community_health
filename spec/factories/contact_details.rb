FactoryGirl.define do
  factory :contact_detail do
    service
    name "MyString"
    address "MyText"
    postcode "MyString"
    phone_number "MyString"
    email "test@optimised.today"
  end

end
