class User < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  has_many :posts
  has_many :comments

  has_secure_password
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, 
                    format:     { with: VALID_EMAIL_REGEX },
                    presence:   true
  validates :password, length: { minimum: 6 }
  validates :display_name, presence: true, length: { maximum: 50 }

  def display_name
    read_attribute(:display_name) || 'Guest'
  end

  def join_date
    created_at.to_formatted_s(:long_just_date)
  end

  def time_since_joined
    if created_at.to_date == Date.today
      'today!'
    else
      time_ago_in_words(created_at) + ' ago.'
    end
  end

  def logged_in?
    persisted?
  end
end
