FactoryGirl.define do
  factory :service do
    sequence(:name) {|n| "Service #{ n }"}
    overview "Service overview"
    colour { Service::COLOURS[Random.rand(Service::COLOURS.size)] }
    menu_name "menu"
    subdomain "blah"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :service_with_image, traits: [:with_image]
  end

end
