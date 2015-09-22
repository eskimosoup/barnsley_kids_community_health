FactoryGirl.define do
  factory :pathway_section do
    name "MyString"
    position 1
    display true
    factory :pathway_section_with_rows_and_jigsaw_pieces do
      transient do
        pathway_rows_count 3
        pathway_jigsaw_pieces_count 3
      end

      after(:create) do |pathway_section, evaluator|
        create_list(:pathway_row, evaluator.pathway_rows_count, pathway_section: pathway_section)
        create_list(:pathway_jigsaw_piece, evaluator.pathway_jigsaw_pieces_count, pathway_section: pathway_section)
      end
    end
  end

end
