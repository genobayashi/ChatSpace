class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true, if: "image.blank?"
  mount_uploader :image, ImageUploader
end
