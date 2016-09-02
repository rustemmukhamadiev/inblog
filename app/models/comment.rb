class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :text, presence: true

  scope :sorted_desc, -> { order(created_at: :desc) }
end
