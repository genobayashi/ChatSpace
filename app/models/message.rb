class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true, if: "image.blank?"
  mount_uploader :image, ImageUploader
  scope :after_id, -> (last_message_id) { where( "id > ?", last_message_id ) }
end
