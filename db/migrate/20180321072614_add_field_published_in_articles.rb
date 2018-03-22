class AddFieldPublishedInArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :pulished, :boolean
  end
end
