class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { maximum: 100 }
  validates :contents, presence: true, length: { maximum: 500 }

  def created_by
    post_user.display_name
  end

  def formatted_date
    created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%e %b %Y at %H:%M")
  end

  private 

  def post_user
    user || User.new
  end
end
