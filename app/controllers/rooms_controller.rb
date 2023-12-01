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
      respond_to do |format|
        format.html { redirect_to new_house_room_path(@house) }
        format.json # Follows the classic Rails flow and look for a create.json view
        format.text { render partial: "rooms/roomDetails", locals: { room: @room }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
        format.text { render partial: "rooms/roomDetails", locals: { room: @room }, formats: [:html] }
      end

    end
  end

  private

  def room_params
    params.require(:room).permit(:number, :user_id)
  end
end
