class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def created_by
    comment_user.display_name
  end

  def formatted_date
    created_at.in_time_zone("Eastern Time (US & Canada)").strftime("Posted on %e %b %Y at %H:%M")
  end

  private

  def comment_user
    user || User.new
  end

end
