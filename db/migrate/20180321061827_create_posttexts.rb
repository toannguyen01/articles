class CreatePosttexts < ActiveRecord::Migration[5.1]
  def change
    create_table :posttexts do |t|
      t.string :headline
      t.string :content
      t.string :order_show
      t.string :like

      t.timestamps
    end
  end
end
