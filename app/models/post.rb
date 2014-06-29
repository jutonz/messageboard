class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def created_by
    post_user.display_name
  end

  private 

  def post_user
    user || User.new
  end
end
