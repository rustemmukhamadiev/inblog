class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :username, :email, :avatar
  delegate :url, :present?, to: :avatar, prefix: true

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def thumb_avatar
    h.image_tag(
      object.avatar.url(:thumb),
      class: "round-avatar avatar-thumb"
    )
  end
end
