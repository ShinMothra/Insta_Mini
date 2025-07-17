class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_by_users, through: :likes, source: :user

end
