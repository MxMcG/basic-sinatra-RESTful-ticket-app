class Ticket < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_one :posts
  has_many :comments, through: :posts

end
