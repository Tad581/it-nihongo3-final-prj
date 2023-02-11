class FollowsController < ApplicationController
  def send_friend_request
    @user = User.find(params[:id])
    @user.followers << current_user
    redirect_back(fallback_location: root_path)
  end

  def delete_friend_request #xoa ban
    @follower = current_user.followers.delete(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def accept_friend_request
    @followee = User.find(params[:id])
    current_user.followers << @followee
    redirect_back(fallback_location: root_path)
  end

  def cancel_friend_request #huy ket ban
    current_user.followees.delete(params[:id])
    redirect_back(fallback_location: root_path)
  end
end
