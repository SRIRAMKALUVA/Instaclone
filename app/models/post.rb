 class Post < ApplicationRecord
   belongs_to :user
   default_scope -> { order('created_at DESC') }
   has_one_attached :image
   validates :user_id, presence: true
end
