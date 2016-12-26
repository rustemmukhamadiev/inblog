class CommentDecorator < ApplicationDecorator
  delegate :text
  delegate :round_thumb_avatar, :username, :full_name, to: :user, prefix: true

  def posted_by
    "#{user.full_name} | #{formatted_created_at} ago"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end

  private

  def user
    @_user ||= object.user.decorate
  end
end
