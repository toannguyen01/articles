class AddFieldOrderShoeInPostimages < ActiveRecord::Migration[5.1]
  def change
    add_column :postimages, :order_show, :integer
    add_column :postimages, :like, :integer
  end
end
