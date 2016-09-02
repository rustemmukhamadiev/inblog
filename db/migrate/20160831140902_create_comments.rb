class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false

      t.references :user, index: true, null: false, foreign_key: true
      t.references :article, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
