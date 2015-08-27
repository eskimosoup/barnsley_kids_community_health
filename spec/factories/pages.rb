FactoryGirl.define do
  factory :page do
    sequence(:title) {|n| "Page #{ n }"}
    style "basic"
    layout "application"
    content "My fancy page content"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :page_with_image, traits: [:with_image]
  end

end
