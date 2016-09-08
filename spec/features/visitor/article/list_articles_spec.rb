require "rails_helper"

feature "List articles" do
  let!(:articles) { create_list(:article, 2) }
  let(:article) { articles.last.decorate }

  background { visit root_path }

  scenario "Visitor shows lists articles on home page" do
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.description)
  end
end
