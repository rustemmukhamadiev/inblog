require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"
  let(:article_attr) { attributes_for(:article) }

  background do
    visit new_users_article_path
  end

  scenario "User create post" do
    fill_form(:article, article_attr)
    click_button "Create Article"

    expect(page).to have_content("Article was successfully created")
  end
end
