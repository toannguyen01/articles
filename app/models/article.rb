class Article < ActiveRecord::Base
  validates :title, presence: true
  has_many :posttexts
  has_many :postimages
  scope :published, -> { where(published: true)}

end