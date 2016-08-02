class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :text, presence: true

  scope :with_user, -> { includes(:user) }
  scope :sorted, -> { order(created_at: :desc) }
end
