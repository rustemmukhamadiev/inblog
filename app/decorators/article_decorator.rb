class ArticleDecorator < ApplicationDecorator
  delegate :title, :text
  delegate :thumb_avatar, to: :user, prefix: true

  def description
    text.truncate(280, separator: " ")
  end

  def posted_by
    "#{user.full_name} | #{formatted_created_at} ago"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end

  def comment_count_link
    h.link_to("#{h.article_path(object)}#discussion") do
      ("Сomments: " + object.comments.count.to_s).html_safe
    end
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
