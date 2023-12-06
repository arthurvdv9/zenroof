class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
  end

  def dashboard
    @houses = House.where(user_id: current_user)
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @houses = @houses.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @ticket = Ticket.new


    # @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
    # Additional code to handle the case where @room is not found
    # @is_user_owner = current_user.houses.size > 0
    # # @is_user_tenant = @is_user_owner ? is_owner_also_tenant : true
    @is_user_owner = current_user.houses.size > 0
    @room = current_user.room
    @tickets = @room.present? ? Ticket.where(room_id: @room.id) : []
    end
    # @room_id = @is_user_owner ? retrieve_tenant_room : current_user.rooms[0]
    # @room = Room.find_by(id: @room_id)
    # puts "HELLOOOOOOOOOOOOOOOOOOO"
    # puts @houses


  def tenanthistory
    @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query"
      @tickets = @tickets.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @room = current_user.room
  end

  def ownerhistory
    @house = House.find(params[:house_id])
    @rooms = Room.where(house_id: @house.id)
    @tickets = @rooms.map { |room| room.tickets }.flatten
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
