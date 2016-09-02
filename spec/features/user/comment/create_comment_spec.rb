require "rails_helper"

feature "Create comment" do
  include_context "current user signed in"

  let(:article) { create :article }
  let(:comment_params) { attributes_for :comment }

  background do
    visit article_path(article)
  end

  scenario "User creates comment" do
    fill_form :comment, comment_params
    click_button "Create Comment"

    expect(page).to have_content(comment_params[:text])
  end

  scenario "User creates empty comment" do
    fill_form(:comment, text: "")
    click_on "Create Comment"

    expect(page).to have_content("can't be blank")
  end
end
