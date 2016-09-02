require "rails_helper"

feature "Comments List" do
  let(:comment) { create(:comment) }

  background do
    visit article_path(comment.article)
  end

  scenario "Visitor can see comments list" do
    expect(page).to have_content(comment.text)
  end
end
