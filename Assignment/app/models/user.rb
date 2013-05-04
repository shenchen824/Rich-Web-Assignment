class User < ActiveRecord::Base
  # Reference: gem devise user models, avaliable: https://github.com/plataformatec/devise

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  #associated with comments
  has_many :comments
  #associated with posts
  has_many :posts

end
