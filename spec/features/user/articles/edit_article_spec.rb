require "rails_helper"

feature "Edit Article" do
  include_context "current user signed in"
  let(:article) { create :article, user: current_user }
  let(:another_article) { create :article }

  scenario "User edits article" do
    visit article_path(article)
    click_on "Edit"

    fill_form(:article, title: "New title", text: "New text")
    click_on "Update Article"

    expect(page).to have_content("Article was successfully updated.")
  end

  scenario "User edits a article another user" do
    visit edit_users_article_path(another_article)

    expect(current_path).to eq root_path
  end
end
