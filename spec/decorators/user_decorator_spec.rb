require "rails_helper"

describe UserDecorator do
  let(:user) do
    create(:user,
      full_name: "Alex",
      username: "alexnick",
      email: "test@test.com",
      image: File.new("#{Rails.root}/spec/fixtures/images/image.png"))
  end

  let(:decorated_user) { user.decorate }

  describe "#full_name_with_email" do
    subject { decorated_user.full_name_with_email }

    it { is_expected.to eq "Alex (test@test.com)" }
  end
end
