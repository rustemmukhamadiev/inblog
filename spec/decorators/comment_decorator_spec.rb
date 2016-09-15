require "rails_helper"

describe CommentDecorator do
  let(:user) { create :user, full_name: "Alex", username: "alexnick" }
  let!(:time) { Time.now.utc - 1.minute }
  let!(:comment) { create(:comment, user: user, created_at: time).decorate }

  describe "#formatted_created_at" do
    subject { comment.formatted_created_at }

    it { is_expected.to eq "1 minute" }
  end

  describe "#posted_by" do
    subject { comment.posted_by }

    it { is_expected.to eq "Alex | 1 minute ago" }
  end
end
