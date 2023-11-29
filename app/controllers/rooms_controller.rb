class RoomsController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @room = Room.new

  end

  def create
    # we need the correspondent house where this is nested:
    @house = House.find(params[:house_id])

    @room = Room.new(room_params)

    @room.house = @house
    @room.user = current_user

    if @room.save
      respond_to do |format|
        format.html { redirect_to new_house_room_path(@house) }
        format.text { render partial: "houses/formRoom", locals: { house: @house, room: Room.new }, formats: [:html] }
      end
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def room_params
    params.require(:room).permit(:number)
  end
end
