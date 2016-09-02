class ArticleDecorator < ApplicationDecorator
  decorates_association :user

  delegate :title, :text
  delegate :thumb_avatar, to: :user, prefix: true

  def description
    text.truncate(160, separator: " ")
  end

  def posted_by
    "#{user.full_name} | #{h.time_ago_in_words(object.created_at)} ago"
  end

  def comment_count
    "Сomments: #{object.comments.count}"
  end
end
