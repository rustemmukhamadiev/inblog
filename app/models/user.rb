class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :article

  validates :full_name, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing_photo.png"

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
end
