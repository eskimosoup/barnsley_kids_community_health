FactoryGirl.define do
  factory :banner do
    sequence(:name) {|n| "Banner #{ n }" }
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    content "<p>Banner Content</p>"
    display true
  end
end
