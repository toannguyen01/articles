class AddReferencePostimageArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :postimages, :article, index: true
  end
end
