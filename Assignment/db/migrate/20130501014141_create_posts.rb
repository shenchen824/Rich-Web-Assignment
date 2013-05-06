# This file is for creating post table
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contents
      t.integer :user_id
      t.timestamps
    end
  end
end
