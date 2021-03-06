class Micropost < ApplicationRecord
  acts_as_votable
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_one_attached :image
  has_many :comments, as: :commentable
  has_many :notifications, dependent: :destroy
  validates :caption, length: { maximum: 140 }
  validates :user_id, presence: true
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
