class Post < ActiveRecord::Base
  attr_accessible :contents, :title, :user_id
  #limite the title words
  validates :title, :presence => true, :length =>
  {
  	#Title limitation is 50 words
  	:maximum => 50,
    :minimum => 1,
  	:tokenizer => lambda { |str| str.scan(/\w+/) },
	  :too_long  => "Please limit your title to %{count} words",
    :too_short  => "Please make sure your title over %{count} words"
  }
  #limite the post contents words
  validates :contents, :presence => true, :length =>
  { 
  	#Content limitation is 140 words
	  :maximum => 140,
    :minimum => 1,
	  :tokenizer => lambda { |str| str.scan(/\w+/) },
	  :too_long  => "Please limit your contents to %{count} words",
    :too_short  => "Please make sure your contents over %{count} words"
  }

  def self.search(search)
    if search
      find(:all, :conditions => ['contents LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  #associated with commtents
  has_many :comments
  #associated with user
  belongs_to :user
end
