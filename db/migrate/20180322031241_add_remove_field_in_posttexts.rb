class AddRemoveFieldInPosttexts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posttexts, :order_show
    remove_column :posttexts, :like
    add_column :posttexts, :order_show, :integer
    add_column :posttexts, :like, :integer
  end
end
