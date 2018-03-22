class CreatePostimages < ActiveRecord::Migration[5.1]
  def change
    create_table :postimages do |t|
      t.string :headline
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
