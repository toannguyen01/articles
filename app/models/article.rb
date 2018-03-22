class Article < ActiveRecord::Base
  has_many :posttexts
  has_many :postimages
  scope :published, -> { where(published: true)}

end