class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_data, :text, null: false, default: ""
  end
end
