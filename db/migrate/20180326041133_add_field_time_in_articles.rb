class AddFieldTimeInArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :date_up, :datetime
  end
end
