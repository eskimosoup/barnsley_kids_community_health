require 'rails_helper'

RSpec.feature "ViewingArticles", type: :feature do
  let!(:articles) { create_list(:article, 4) }

  it "should allow users to view articles" do
    visit articles_path
    expect(current_path).to eq(articles_path)
    expect(page).to have_content("News")
    expect(page).to have_content("Read More", count: 4)
    articles.each do |article|
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.summary) if article.summary
    end
    first(".button.read-more").click
    selected_article = articles.first
    expect(current_path).to eq(article_path(selected_article))
    within("h1") do
      expect(page).to have_content(selected_article.title)
    end
    expect(page).to have_content(selected_article.content)
  end
end
