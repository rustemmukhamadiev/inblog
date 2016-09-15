require "rails_helper"

describe ArticleDecorator do
  let(:user) { create :user, full_name: "Alex", username: "alexnick" }
  let!(:time) { Time.now.utc - 1.minute }
  let!(:article) { create(:article, user: user, created_at: time, text: "q" * 300) }
  let(:decorated_article) { article.decorate }
  let!(:comments) { create_list :comment, 2, article: article }

  describe "#description" do
    subject { decorated_article.description }

    it { is_expected.to eq "q" * 277 + "..." }
  end

  describe "#formatted_created_at" do
    subject { decorated_article.formatted_created_at }

    it { is_expected.to eq "1 minute" }
  end

  describe "#posted_by" do
    subject { decorated_article.posted_by }

    it { is_expected.to eq "Alex | 1 minute ago" }
  end

  describe "#comments_count" do
    subject { decorated_article.comments_count }

    it { is_expected.to eq "2" }
  end
end
