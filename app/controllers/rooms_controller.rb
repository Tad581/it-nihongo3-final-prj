class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render "index"
  end
end
