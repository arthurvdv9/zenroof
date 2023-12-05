class RoomsController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @room = Room.new
  end

  def create
    # we need the correspondent house where this is nested:
    @house = House.find(params[:house_id])
    @user = params[:room][:user].empty? ? current_user : User.find(params[:room][:user].to_i)

    @room = Room.new(room_params)

    @room.house = @house
    @room.user = @user

    if @room.save
      redirect_to new_house_room_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:number, :user_id)
  end
end
