class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :ticket
  has_many :comments
end
