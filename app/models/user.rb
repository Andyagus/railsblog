class User < ActiveRecord::Base
   has_many :posts
   has_many :comments
   validates :password, presence: true,
   confirmation: true
   validates_confirmation_of :password 
end
