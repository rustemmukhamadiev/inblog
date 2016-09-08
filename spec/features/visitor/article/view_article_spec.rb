require "rails_helper"

feature "View article" do
  let(:user) { create :user, full_name: "User full name" }
  let(:article) do
    create :article,
      title: "Title",
      text: "Text",
      user: user
  end

  scenario "Visitor views article" do
    visit article_path(article)

    expect(page).to have_content "Title"
    expect(page).to have_content "Text"
    expect(page).to have_content "User full name"
  end
end
