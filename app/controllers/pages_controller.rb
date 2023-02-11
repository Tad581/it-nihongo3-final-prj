class PagesController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @nicknameList = []
    @thumbnailList = []
    @posts.each do |post|
      name = User.find(post.user_id).name
      avatar = User.find(post.user_id).avatar_thumbnail
      @nicknameList << name
      @thumbnailList << avatar
    end
  end

  def search
    @parameters = params[:query].downcase
    if !@parameters.blank?
      @search_user = User.all.where("id <> #{current_user.id} and lower(name) LIKE '%#{@parameters}%'")
    else
      @search_user = []
    end
  end
end
