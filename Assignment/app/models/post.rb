class Post < ActiveRecord::Base
   # determines these variables which can be set in a mass assignment
  attr_accessible :contents, :title, :user_id
  #limite the title words
  validates :title, :presence => true, :length =>
  {
  	#Determines max title limitation words
  	:maximum => 50,
    #Determines min title limitation words
    :minimum => 1,
    #Recognise the words
  	:tokenizer => lambda { |str| str.scan(/\w+/) },
    #Error Messages
	  :too_long  => "Please limit your title to %{count} words",
    :too_short  => "Please make sure your title over %{count} words"
  }
  #limite the post contents words
  validates :contents, :presence => true, :length =>
  { 
  	#Determines max contents limitation words
	  :maximum => 140,
    #Determines min contents limitation words
    :minimum => 1,
    #Recognise the words
	  :tokenizer => lambda { |str| str.scan(/\w+/) },
    #Error Messages
	  :too_long  => "Please limit your contents to %{count} words",
    :too_short  => "Please make sure your contents over %{count} words"
  }

  #implement the searching method by querying data from databases
  #"Like" is used here
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  #associated with commtents
  has_many :comments
  #associated with user
  belongs_to :user
end
