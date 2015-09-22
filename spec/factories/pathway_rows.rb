FactoryGirl.define do
  factory :pathway_row do
    pathway_section
    position 1
    sequence(:name) {|n| "Row #{ n }" }
    colour { PathwayRow::COLOURS.first }
    content "My content"
    display true
  end

end
