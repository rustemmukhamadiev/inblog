require "rails_helper"

feature "List user articles" do
  let!(:user) { create :user }
  let!(:articles) { create_list(:article, 2, user: user) }
  let(:article) { articles.last.decorate }

  background { visit username_articles_path(user.username) }

  scenario "Visitor shows lists user articles on page" do
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.description)
    expect(page).to have_content(article.posted_by)
  end
end
