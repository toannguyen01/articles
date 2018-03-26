class Article < ActiveRecord::Base
  validates :title, presence: true
  has_many :posttexts
  has_many :postimages
  scope :published, -> { where(published: true)}
  scope :public_article, -> { where( 'date_up <= ?', Time.now) }
  scope :no_public_article, -> { where( 'date_up > ?', Time.now) }
end