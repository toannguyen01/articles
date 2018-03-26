class Posttext < ApplicationRecord
  belongs_to :article
  validates :headline, presence: true
end
