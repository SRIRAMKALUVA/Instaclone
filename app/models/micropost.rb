class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_one_attached :image
  validates :caption, length: { maximum: 140 }
  validates :user_id, presence: true
end
