class RemoveFieldPublishedArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :pulished, :boolean
  end
end
