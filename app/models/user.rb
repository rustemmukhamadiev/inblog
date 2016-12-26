class User < ActiveRecord::Base
  include ImageUploader[:image]

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  validates :full_name, presence: true
  validates :username,
    presence: true,
    uniqueness: true,
    format: { with: /\A[a-z]+[a-z]+\z/, message: "only allows letters" }

  private

  def downcase_username
    username.downcase! if username.present?
  end
end
