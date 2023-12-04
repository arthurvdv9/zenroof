class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def history
    @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
  end

  def home
  end

  def dashboard
    @houses = House.where(user_id: current_user)
    @ticket = Ticket.new
    #@tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
      # Additional code to handle the case where @room is not found
    # @is_user_owner = current_user.houses.size > 0
    # # @is_user_tenant = @is_user_owner ? is_owner_also_tenant : true
    @is_user_owner = current_user.houses.size > 0
    @room = current_user.room
    @tickets = @room.present? ? Ticket.where(room_id: @room.id) : []
    # @room_id = @is_user_owner ? retrieve_tenant_room : current_user.rooms[0]
    # @room = Room.find_by(id: @room_id)
  end

  private

  # def list_tenant_rooms_for_owner
  #   rooms_ids = current_user.rooms.map { |room| room.id }
  #   houses_rooms_ids = current_user.houses.map { |house| house.rooms.map { |room| room.id } }.flatten
  #   houses_rooms_ids - rooms_ids
  # end

  #  def is_owner_also_tenant
  #   list_tenant_rooms_for_owner.size > 0
  # end

  # def retrieve_tenant_room
  #  list_tenant_rooms_for_owner[0]
  # end
end
