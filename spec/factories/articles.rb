FactoryGirl.define do
  factory :article do
    sequence(:title) {|n| "Title #{ n }"}
    summary "Summary"
    content "Bacon ipsum dolor amet leberkas ball tip sirloin brisket ribeye strip steak pancetta, tongue alcatra."
    date { Date.today - 2.weeks }
    display true
  end
end
