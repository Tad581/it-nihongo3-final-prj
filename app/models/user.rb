class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :all_except, ->(user) { where.not(id: user) }

  after_create_commit { broadcast_append_to "users" }

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users

  has_many :posts
  has_many :messages

  def not_following
    @following = self.followees
    @users = User.all
    @not_following = @users - @following
  end

  def friend_request_list
    @wating_request = self.followers - self.followees
    return @wating_request
  end

  def friend_status(friend_id)
    begin
      self.followees.find(friend_id)
      check_is_friend(friend_id)
    rescue
      return "not followed"
    end
  end

  def is_friend(current_user)
    begin
      if current_user.followees.find(self.id) && current_user.followers.find(self.id)
        return true
      end
    rescue
      return false
    end
  end

  private

  def check_is_friend(friend_id)
    begin
      User.find(friend_id).followees.find(self.id)
      return "friend"
    rescue
      return "not friend"
    end
  end
end
