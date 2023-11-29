class RoomsController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @room = Room.new

  end

  def create
    @house = House.find(params[:house_id])

    @room = Room.new(room_params)

    # connect
    @room.user = current_user
    @room.house = @house

    if @room.save
      redirect_to houses_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def room_params
    params.require(:room).permit(:number)
  end
end
