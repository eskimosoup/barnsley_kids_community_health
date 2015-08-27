require 'rails_helper'

RSpec.feature "ViewingPages", type: :feature do

  it "should allow user to view a page" do
    page_model = create(:page)
    visit page_path(page_model)
    expect(current_path).to eq(page_path(page_model))

    within("h1") do
      expect(page).to have_content(page_model.title)
    end

    expect(page).to have_content(page_model.content)
  end

  it "should not allow a page to be viewed" do
    page_model = create(:page, display: false)
    expect{ visit page_path(page_model) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
