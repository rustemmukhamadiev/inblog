class AddUsernameForUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, default: "", null: false, limit: 30, unique: true
  end
end
