FactoryGirl.define do
  factory :pathway_jigsaw_piece do
    pathway_section
    sequence(:name){|n| "Name #{ n }" }
    position 1
    colour { PathwayJigsawPiece::COLOURS.first }
    display true
  end

end
