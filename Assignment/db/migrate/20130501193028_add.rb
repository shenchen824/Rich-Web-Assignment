# adding references into comments tables
class Add < ActiveRecord::Migration
  def up
  	add_column :comments, :user_id, :integer
  end

  def down
  end
end

