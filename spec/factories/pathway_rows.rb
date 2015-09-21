FactoryGirl.define do
  factory :pathway_row do
    pathway_section
    position 1
    sequence(:name) {|n| "Row #{ n }" }
    colour "pink"
    content "My content"
    display true
  end

end
