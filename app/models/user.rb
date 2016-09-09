class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  validates :full_name, presence: true
  validates :username,
    presence: true,
    uniqueness: true,
    format: { with: /\A[a-z]+[a-z]+\z/, message: "only allows letters" }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing_photo.png"

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

  private

  def downcase_username
    username.downcase! if username.present?
  end
end
