class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user
  # belongs_to :subscribed_user
  belongs_to :micropost
  validates :user_id, :notified_by_id, :micropost_id, :identifier, :notice_type, presence: true
end
