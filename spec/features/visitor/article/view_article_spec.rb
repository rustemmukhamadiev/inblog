require "rails_helper"

feature "View article" do
  let(:article) { create(:article).decorate }

  scenario "Visitor views article" do
    visit article_path(article)

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.text)
    expect(page).to have_content(article.posted_by)
  end
end
