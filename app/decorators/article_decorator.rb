class ArticleDecorator < ApplicationDecorator
  delegate :title, :text
  delegate :thumb_avatar, to: :user, prefix: true

  def description
    text.truncate(160, separator: " ")
  end

  def posted_by
    "#{user.full_name} | #{formatted_created_at} ago"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end

  def comment_count
    "Сomments: #{object.comments.count}"
  end

  private

  def user
    @_user ||= object.user.decorate
  end
end
