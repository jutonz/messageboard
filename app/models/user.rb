class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments

  def display_name
    read_attribute(:display_name) || "Guest"
  end

  def logged_in?
    persisted?
  end
end
