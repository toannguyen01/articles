class AddReferenceImageTextArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :posttexts, :article, index: true
  end
end
