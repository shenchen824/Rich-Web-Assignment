class Comment < ActiveRecord::Base
  attr_accessible :text, :post_id, :user_id

  #limite the comments words
  validates :text, :presence => true
  #associated with post
  belongs_to :post
  #associated with user
  belongs_to :user
end
