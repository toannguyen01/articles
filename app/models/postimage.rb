class Postimage < ApplicationRecord
  belongs_to :article
  mount_uploader :image, ImageUploader
  validates :headline, presence: true
end
