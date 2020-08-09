class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
end
