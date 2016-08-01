class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :article

  validates :full_name, presence: true
end
