FactoryGirl.define do
  factory :service do
    sequence(:name) {|n| "Service #{ n }"}
    overview "Service overview"
    colour { Service::COLOURS[Random.rand(Service::COLOURS.size)] }
    sequence(:menu_name) {|n| Service::MENU_NAMES[n % Service::MENU_NAMES.size] }
    sequence(:subdomain) {|n| "blah#{ n }" }
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :service_with_image, traits: [:with_image]
  end

end
