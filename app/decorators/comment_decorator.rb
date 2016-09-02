class CommentDecorator < ApplicationDecorator
  decorates_association :user

  delegate :text
  delegate :thumb_avatar, to: :user, prefix: true

  def posted_by
    "#{user.full_name} | #{formatted_created_at}"
  end

  def formatted_created_at
    h.time_ago_in_words(object.created_at)
  end
end
