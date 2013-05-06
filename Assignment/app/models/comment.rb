class Comment < ActiveRecord::Base
  # determines these variables which can be set in a mass assignment
  attr_accessible :text, :post_id, :user_id

  validates :text, :presence => true
  #associated with post
  belongs_to :post
  #associated with user
  belongs_to :user
end
