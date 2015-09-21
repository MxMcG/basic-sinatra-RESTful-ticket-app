class Ticket < ActiveRecord::Base
  # Remember to create a migration!
  has_one :posts
  has_many :comments, through: :posts
end
