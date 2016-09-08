class CommentDecorator < ApplicationDecorator
  delegate :text
  delegate :thumb_avatar, to: :user, prefix: true

  def posted_by
    "#{user.full_name} | #{formatted_created_at} ago"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end

  def username_link
    h.link_to(h.username_articles_path(user.username)) do
      (user.full_name + " | " + formatted_created_at + " ago").html_safe
    end
  end

  private

  def user
    @_user ||= object.user.decorate
  end
end
