class ArticleDecorator < ApplicationDecorator
  delegate :title, :text
  delegate :round_thumb_avatar, :username, :full_name, to: :user, prefix: true

  def description
    text.truncate(280, separator: " ")
  end

  def posted_by
    "#{user_full_name} | #{formatted_created_at} ago"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end

  def comments_count
    object.comments.count.to_s
  end

  private

  def user
    @_user ||= object.user.decorate
  end
end
