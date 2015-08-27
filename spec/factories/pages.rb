FactoryGirl.define do
  factory :page do
    sequence(:title) {|n| "Page #{ n }"}
    style "basic"
    layout "application"
    content "My fancy page content"
    display true
  end

end
