class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :username, :email, :avatar

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def image_url
    object.image_url(:thumb)
  end

  def round_thumb_avatar
    h.image_tag(
      object.image_url(:thumb),
      class: "round-avatar avatar-thumb"
    )
  end
end
