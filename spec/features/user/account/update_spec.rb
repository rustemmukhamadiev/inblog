require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"
  let(:avatar_wrapper) { ".avatar-preview" }

  scenario "User updates account with valid data" do
    visit edit_user_registration_path(current_user)

    attach_file("Avatar", "#{Rails.root}/spec/fixtures/images/image.png")
    fill_form(:user, full_name: "New Name")

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end
end
