FactoryGirl.define do
  factory :article do
    sequence(:title) {|n| "Title #{ n }"}
    summary "Summary"
    content "Bacon ipsum dolor amet leberkas ball tip sirloin brisket ribeye strip steak pancetta, tongue alcatra."
    date { Date.today - 2.weeks }
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :article_with_image, traits: [:with_image]
  end
end
