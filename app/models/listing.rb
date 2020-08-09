class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :image, content_type: { in: %w[image/jpegnimage/gif image/png],
                                    message: "must be a valid image format"},
                                size: { less_than: 5.megabytes,
                                        message: "should be less than 5MB"}
end
